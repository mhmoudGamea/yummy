import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/features/user/profile/presentation/model-views/profile_cubit/profile_cubit.dart';
import 'package:yummy/features/user/profile/presentation/views/widgets/edit/image_edit.dart';

import '../../../../../../../core/widgets/c_expanded_button.dart';
import 'edit_text_field.dart';

class UserEditProfileViewBody extends StatelessWidget {
  const UserEditProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<ProfileCubit>(context);
    final media = MediaQuery.of(context).size;
    return Container(
      color: primaryColor,
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
                      // const SizedBox(height: 15),
                      // const Row(
                      //   children: [
                      //     Icon(
                      //       FontAwesomeIcons.circleExclamation,
                      //       size: 17,
                      //       color: Colors.amber,
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Flexible(
                      //       child: Text(
                      //           'If you didn\'t select any image you will still using your old profile image.'),
                      //     )
                      //   ],
                      // ),
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
                          controller: data.getNameController,
                          validator: (value) {
                            return null;
                          }),
                      const SizedBox(height: 10),
                      EditTextField(
                          icon: Icons.phone_rounded,
                          label: 'Phone',
                          type: TextInputType.phone,
                          controller: data.getNameController,
                          validator: (value) {
                            return null;
                          }),
                      const SizedBox(height: 30),
                      CExpandedButton(
                        bgColor: primaryColor,
                        text: 'Confirm',
                        textColor: Colors.white,
                        onPress: () async {
                          print('************************************');
                          print(uid);
                          print(userPhone);
                          print('************************************');
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
