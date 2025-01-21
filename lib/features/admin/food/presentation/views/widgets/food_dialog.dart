import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';
import '../../../../widgets/c_drop_down_button.dart';
import '../../../../widgets/c_expanded_delete.dart';
import '../../../../widgets/c_expanded_save.dart';
import '../../../../widgets/c_text_form_field.dart';
import '../../model_views/food_cubit/food_cubit.dart';
import 'c_ingrediant_images_grid.dart';

class FoodDialog extends StatelessWidget {
  const FoodDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final food = BlocProvider.of<FoodCubit>(context);
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        return Dialog(
          elevation: 2,
          shadowColor: AppColors.greyColor,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: food.getFormKey,
                      child: Column(
                        children: [
                          CDropDownButton(
                            label: 'Category Name',
                            icon: FontAwesomeIcons.layerGroup,
                            selectedValue: food.getSelectedCategory,
                            items: food.convertCategory(),
                            onPress: (value) {
                              food.setSelectedCategory = value;
                            },
                          ),
                          CDropDownButton(
                            label: 'Collection Name',
                            icon: FontAwesomeIcons.bowlFood,
                            selectedValue: food.getSelectedCollection,
                            items: food.convertCollection(),
                            onPress: (value) {
                              food.setSelectedCollection = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          CTextFormField(
                            label: 'Food Name',
                            type: TextInputType.name,
                            controller: food.getFoodNameController,
                            icon: FontAwesomeIcons.burger,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Food name is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CTextFormField(
                            label: 'Calories',
                            type: TextInputType.number,
                            controller: food.getCaloriesController,
                            icon: FontAwesomeIcons.calculator,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Food calories is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CTextFormField(
                            label: 'Prepare Time',
                            type: TextInputType.number,
                            controller: food.getPrepareController,
                            icon: FontAwesomeIcons.clock,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Prepare time is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CTextFormField(
                            label: 'Rate',
                            type: TextInputType.number,
                            controller: food.getRateController,
                            icon: Icons.star_rounded,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Food rate is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CTextFormField(
                            label: 'Price',
                            type: TextInputType.number,
                            controller: food.getPriceController,
                            icon: FontAwesomeIcons.dollarSign,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Food Price is required';
                              }
                              return null;
                            },
                          ),
                          CTextFormField(
                            label: 'Description',
                            type: TextInputType.name,
                            controller: food.getDescriptionController,
                            icon: FontAwesomeIcons.commentDots,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Description is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          // ingrediants images
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: CIngrediantImagesGrid(
                                ingrediantsImages: food.getIngrediantsImages),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: CExpandedButton(
                              text: 'Pick Ingrdiants Images',
                              bgColor: AppColors.primaryColor,
                              textColor: Colors.white,
                              onPress: () => food.pickIngrediantsImages(),
                            ),
                          ),
                          // end ingrediants images
                          const SizedBox(height: 20),
                          // food image
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: food.getPickedImage == null
                                ? Icon(
                                    FontAwesomeIcons.image,
                                    size: 100,
                                    color: AppColors.greyColor,
                                  )
                                : Image.file(
                                    food.getPickedImage!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: CExpandedButton(
                              text: 'Pick Image',
                              bgColor: AppColors.primaryColor,
                              textColor: Colors.white,
                              onPress: () => food.pickImage(),
                            ),
                          ),
                          if (state is HitSaveWithoutPickIngrediantImages)
                            Column(
                              children: [
                                const SizedBox(height: 15),
                                Text(
                                  'Please pick at least 1 ingrediant image.',
                                  style: Styles.title13.copyWith(
                                      color: AppColors.secondaryColor),
                                ),
                              ],
                            ),
                          if (state is HitSaveWithoutPickFoodImage)
                            Column(
                              children: [
                                const SizedBox(height: 15),
                                Text(
                                  'Please pick a food image first.',
                                  style: Styles.title13.copyWith(
                                      color: AppColors.secondaryColor),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
                child: Row(
                  children: [
                    CExpandedDelete(
                        text: 'Delete',
                        onPress: () {
                          GoRouter.of(context).pop();
                          food.delete();
                        }),
                    const SizedBox(width: 15),
                    CExpandedSave(
                      text: 'Save',
                      onPress: () {
                        food.save(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
