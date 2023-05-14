import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/features/admin/widgets/c_expanded_delete.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';
import '../../../../widgets/c_expanded_save.dart';
import '../../../../widgets/c_text_form_field.dart';
import '../../model_views/food_cubit/food_cubit.dart';

class FoodDialog extends StatelessWidget {
  const FoodDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final food = BlocProvider.of<FoodCubit>(context);
    return Dialog(
        elevation: 2,
        shadowColor: greyColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Form(
              key: food.getFormKey,
              child: Column(
                children: [
                  CTextFormField(
                    label: 'Category Name',
                    type: TextInputType.name,
                    controller: food.getCategoryController,
                    icon: FontAwesomeIcons.layerGroup,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Category name is required';
                      }
                      return null;
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
                    icon: FontAwesomeIcons.star,
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
                  const SizedBox(height: 10),
                  BlocBuilder<FoodCubit, FoodState>(
                    builder: (context, state) {
                      return Container(
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: food.getPickedImage == null
                            ? const Icon(
                                FontAwesomeIcons.image,
                                size: 100,
                                color: greyColor,
                              )
                            : Image.file(
                                food.getPickedImage!,
                                fit: BoxFit.cover,
                              ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      CExpandedDelete(text: 'Delete', onPress: () {}),
                      const SizedBox(width: 15),
                      CExpandedSave(text: 'Save', onPress: () {}),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CExpandedButton(
                    text: 'Pick Image',
                    bgColor: primaryColor,
                    textColor: Colors.white,
                    onPress: () => food.pickImage(),
                  ),
                  BlocBuilder<FoodCubit, FoodState>(
                    builder: (context, state) {
                      // if (state is HitSaveWithoutPickImage) {
                      //   return Column(
                      //     children: [
                      //       const SizedBox(height: 15),
                      //       Text(
                      //         'Please pick an image first.',
                      //         style: Styles.title13
                      //             .copyWith(color: secondaryColor),
                      //       ),
                      //     ],
                      //   );
                      // }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
