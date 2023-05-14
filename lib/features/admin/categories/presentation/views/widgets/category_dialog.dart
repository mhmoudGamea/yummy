import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/features/admin/widgets/c_text_form_field.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';
import '../../model_views/cubit/category_cubit.dart';

class CategoryDialog extends StatelessWidget {
  const CategoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = BlocProvider.of<CategoryCubit>(context);
    return Dialog(
      elevation: 2,
      shadowColor: greyColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  return Container(
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: category.getPickedImage == null
                        ? const Icon(
                            FontAwesomeIcons.image,
                            size: 100,
                            color: greyColor,
                          )
                        : Image.file(
                            category.getPickedImage!,
                            fit: BoxFit.cover,
                          ),
                  );
                },
              ),
              const SizedBox(height: 15),
              Form(
                key: category.getFormKey,
                child: CTextFormField(
                  label: 'Category Name',
                  type: TextInputType.name,
                  controller: category.getCategoryController,
                  icon: FontAwesomeIcons.layerGroup,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Category name is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NeumorphicButton(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          style: NeumorphicStyle(
                              border: NeumorphicBorder(
                                  color: secondaryColor.withOpacity(0.5),
                                  width: 1.2),
                              color: Colors.white),
                          child: Text(
                            'Delete',
                            style: Styles.title14.copyWith(
                              color: secondaryColor.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            category.deletePickedImage();
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      BlocBuilder<CategoryCubit, CategoryState>(
                        builder: (context, state) {
                          // if (state is UploadImageLoading) {
                          //   return Expanded(
                          //       child: Container(
                          //           padding:
                          //               const EdgeInsets.symmetric(horizontal: 32),
                          //           child: const CCircleLoading()));
                          // }
                          return Expanded(
                            child: NeumorphicButton(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              style: const NeumorphicStyle(
                                  border: NeumorphicBorder(
                                      color: babyBlue, width: 1.2),
                                  color: babyBlue),
                              child: Text(
                                'Save',
                                style: Styles.title14.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                category.uploadCategoryImage(context);
                                // GoRouter.of(context).pop();
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  CExpandedButton(
                    text: 'Pick Image',
                    bgColor: primaryColor,
                    textColor: Colors.white,
                    onPress: () => category.pickImage(),
                  ),
                  BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      if (state is HitSaveWithoutPickImage) {
                        return Column(
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              'Please pick an image first.',
                              style: Styles.title13
                                  .copyWith(color: secondaryColor),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
