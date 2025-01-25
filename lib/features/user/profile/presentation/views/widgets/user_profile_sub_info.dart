import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../model-views/profile_cubit/profile_cubit.dart';

class UserProfileSubInfo extends StatefulWidget {
  const UserProfileSubInfo({super.key});

  @override
  State<UserProfileSubInfo> createState() => _UserProfileSubInfoState();
}

class _UserProfileSubInfoState extends State<UserProfileSubInfo> {
  var ordersNumber = 0;
  var spending = 0.0;
  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  void getUserDetails() async {
    final profile = BlocProvider.of<ProfileCubit>(context);
    ordersNumber = await profile.getOrdersNumber();
    spending = await profile.getUserSpending();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is NumberOfOrdersFailure) {
                return userProfileInfoItem(
                    title: 'Orders Number', subtitle: 'N/A');
              }
              return userProfileInfoItem(
                  title: 'Orders Number', subtitle: ordersNumber.toString());
            },
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is UserSpendingSuccess) {
                return userProfileInfoItem(
                    title: 'Spending', subtitle: spending.toString());
              }
              return userProfileInfoItem(title: 'Spending', subtitle: 'N/A');
            },
          ),
        ],
      ),
    );
  }
}

Widget userProfileInfoItem({
  required String title,
  Color titleColor = Colors.black38,
  double titleSize = 13,
  required String subtitle,
  Color subtitleColor = const Color(0xfff9a825),
  double subtitleSize = 16,
}) {
  return Column(
    children: [
      Text(
        title,
        style: Styles.title15.copyWith(color: titleColor, fontSize: titleSize),
      ),
      const SizedBox(height: 10),
      Text(
        subtitle,
        style: Styles.title15
            .copyWith(color: subtitleColor, fontSize: subtitleSize),
      ),
    ],
  );
}
