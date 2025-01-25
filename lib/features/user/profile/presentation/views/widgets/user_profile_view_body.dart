import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/core/widgets/c_error_widget.dart';
import 'package:yummy/features/user/profile/presentation/model-views/profile_cubit/profile_cubit.dart';
import 'package:yummy/features/user/profile/presentation/views/user_edit_profile_view.dart';

import '../../../../home/presentation/views/widgets/home/c_header_name.dart';
import '../faq_view.dart';
import 'more_info_tab.dart';
import 'user_profile_sub_info.dart';
import 'user_profile_info.dart';

class UserProfileViewBody extends StatelessWidget {
  const UserProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetUserInfoLoading) {
          return const Center(child: CCircleLoading());
        } else if (state is GetUserInfoFailure) {
          return const CErrorWidget(
              icon: FontAwesomeIcons.triangleExclamation,
              text: 'Sorry we can\'t get profile information right now.');
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // this widget hold userProfileImage & userProfileAccount
                const UserProfileInfo(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      // this will hold totalSpending
                      const UserProfileSubInfo(),
                      const SizedBox(height: 30),
                      MoreInfoTab(
                        icon: FontAwesomeIcons.bell,
                        text: 'Notification',
                        onTap: () {},
                      ),
                      const SizedBox(height: 15),
                      MoreInfoTab(
                        icon: FontAwesomeIcons.locationDot,
                        text: 'Location',
                        onTap: () {
                          // GoRouter.of(context)
                          //     .push(MapView.rn, extra: _locationModel);
                        },
                      ),
                      const SizedBox(height: 15),
                      MoreInfoTab(
                        icon: FontAwesomeIcons.commentDots,
                        text: 'FAQ',
                        onTap: () {
                          GoRouter.of(context).push(FaqView.rn);
                        },
                      ),
                      const SizedBox(height: 15),
                      const CHeaderName(name: 'Security'),
                      const SizedBox(height: 15),
                      MoreInfoTab(
                        icon: FontAwesomeIcons.lock,
                        text: 'Password',
                        onTap: () {},
                      ),
                      const SizedBox(height: 15),
                      MoreInfoTab(
                        icon: FontAwesomeIcons.penToSquare,
                        text: 'Edit Profile',
                        onTap: () {
                          GoRouter.of(context).push(UserEditProfileView.rn);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
