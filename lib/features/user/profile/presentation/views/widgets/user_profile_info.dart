import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/features/user/profile/presentation/model-views/profile_cubit/profile_cubit.dart';

import '../../../../../../core/models/user_model.dart';
import 'user_profile_account.dart';
import 'user_profile_image.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

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
        UserModel userModel = profileData.getNewUpdatedData(snapshot.data);
        return Column(
          children: [
            UserProfileImage(profileImage: userModel.profileImage),
            const SizedBox(height: 15),
            UserProfileAccount(
                name: userModel.name, phone: userModel.phoneNumber),
          ],
        );
      }),
    );
  }
}
