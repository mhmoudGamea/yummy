import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/features/admin/widgets/c_text_form_field.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';
import '../../../../widgets/c_expanded_delete.dart';
import '../../../../widgets/c_expanded_save.dart';
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
                      CExpandedDelete(
                          text: 'Delete',
                          onPress: () => category.deletePickedImage()),
                      const SizedBox(width: 15),
                      CExpandedSave(
                        text: 'Save',
                        onPress: () {
                          category.uploadCategoryImage(context);
                        },
                      ),
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
