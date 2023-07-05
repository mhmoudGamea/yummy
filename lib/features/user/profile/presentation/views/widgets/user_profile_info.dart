import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/features/user/home/data/data/user_info_model.dart';
import 'package:yummy/features/user/profile/presentation/model-views/profile_cubit/profile_cubit.dart';

import 'user_profile_account.dart';
import 'user_profile_image.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileData = BlocProvider.of<ProfileCubit>(context);
    final snapshot = FirebaseFirestore.instance.collection('users').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: snapshot,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CCircleLoading();
        }
        UserInfoModel userInfoModel =
            profileData.getNewUpdatedData(snapshot.data);
        return Column(
          children: [
            UserProfileImage(profileImage: userInfoModel.profileImage),
            const SizedBox(height: 15),
            UserProfileAccount(
                name: userInfoModel.name, phone: userInfoModel.phoneNumber),
          ],
        );
      }),
    );
  }
}
