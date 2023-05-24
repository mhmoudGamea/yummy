import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../home/presentation/views/widgets/c_header_name.dart';
import 'more_info_tab.dart';
import 'user_profile_account.dart';
import 'user_profile_image.dart';
import 'user_profile_info.dart';

class UserProfileViewBody extends StatelessWidget {
  const UserProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const UserProfileImage(),
            const SizedBox(height: 15),
            const UserProfileAccount(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const UserProfileInfo(),
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
                    onTap: () {},
                  ),
                  const SizedBox(height: 15),
                  MoreInfoTab(
                    icon: FontAwesomeIcons.commentDots,
                    text: 'FAQ',
                    onTap: () {},
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
