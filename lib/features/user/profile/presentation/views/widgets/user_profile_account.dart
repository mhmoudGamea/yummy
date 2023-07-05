import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/profile/presentation/model-views/profile_cubit/profile_cubit.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';

class UserProfileAccount extends StatelessWidget {
  const UserProfileAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<ProfileCubit>(context).getUserInfoModel;
    return Column(
      children: [
        const Text('Margot Robbie', style: Styles.title16),
        const SizedBox(height: 5),
        Text(data!.phoneNumber,
            style: Styles.title13.copyWith(color: greyColor2)),
      ],
    );
  }
}
