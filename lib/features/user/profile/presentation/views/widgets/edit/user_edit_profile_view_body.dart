import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/features/user/profile/presentation/model-views/profile_cubit/profile_cubit.dart';
import 'package:yummy/features/user/profile/presentation/views/widgets/edit/image_edit.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/widgets/c_expanded_button.dart';
import 'edit_text_field.dart';

class UserEditProfileViewBody extends StatelessWidget {
  const UserEditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<ProfileCubit>(context);
    final media = MediaQuery.of(context).size;
    return Container(
      color: AppColors.primaryColor,
      width: media.width,
      child: Column(
        children: [
          Container(
            height: media.height * 0.3,
            padding: EdgeInsets.symmetric(vertical: media.height * 0.05),
            child: const ImageEdit(),
          ),
          Expanded(
            child: Container(
              width: media.width,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.circleExclamation,
                            size: 17,
                            color: AppColors.mintGreen,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              'If you didn\'t select any image you will still using your old profile image.',
                              style: Styles.title13
                                  .copyWith(color: AppColors.greyColor2),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      EditTextField(
                          icon: Icons.person_rounded,
                          label: 'Name',
                          type: TextInputType.name,
                          controller: data.getNameController,
                          validator: (value) {
                            return null;
                          }),
                      const SizedBox(height: 10),
                      EditTextField(
                          icon: Icons.email_rounded,
                          label: 'Email',
                          type: TextInputType.emailAddress,
                          controller: data.getEmailController,
                          validator: (value) {
                            return null;
                          }),
                      const SizedBox(height: 10),
                      EditTextField(
                          icon: Icons.phone_rounded,
                          label: 'Phone',
                          type: TextInputType.phone,
                          controller: data.getPhoneController,
                          validator: (value) {
                            return null;
                          }),
                      const SizedBox(height: 30),
                      BlocConsumer<ProfileCubit, ProfileState>(
                        listener: (context, state) {
                          if (state is UploadProfileImageFailure) {
                            Helper.showCustomToast(
                                context: context,
                                bgColor: AppColors.secondaryColor,
                                icon: FontAwesomeIcons.triangleExclamation,
                                msg:
                                    'Error hapening while uploading your image');
                          } else if (state is SaveProfileImageFailure) {
                            Helper.showCustomToast(
                                context: context,
                                bgColor: AppColors.secondaryColor,
                                icon: FontAwesomeIcons.triangleExclamation,
                                msg: 'Error hapening while Saving your image');
                          } else if (state is ConfirmEditingFailure) {
                            Helper.showCustomToast(
                                context: context,
                                bgColor: AppColors.secondaryColor,
                                icon: FontAwesomeIcons.triangleExclamation,
                                msg: 'Error hapening while updating the data');
                          } else if (state is ConfirmEditingWithImageSuccess) {
                            GoRouter.of(context).pop();
                          }
                        },
                        builder: (context, state) {
                          if (state is ConfirmEditingLoading) {
                            return const CCircleLoading();
                          }
                          return CExpandedButton(
                            bgColor: AppColors.primaryColor,
                            text: 'Confirm',
                            textColor: Colors.white,
                            onPress: () {
                              data.confirmEditingUserProfileData();
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
