import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yummy/features/user/profile/presentation/model-views/profile_cubit/profile_cubit.dart';

class UserProfileImage extends StatelessWidget {
  final String? profileImage;
  const UserProfileImage({super.key, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    // final profile = BlocProvider.of<ProfileCubit>(context);
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(75),
        image: DecorationImage(
          image: NetworkImage((profileImage != null && profileImage != '')
              ? profileImage!
              : 'https://img.freepik.com/premium-vector/cute-brunette-young-girl_128665-103.jpg?size=626&ext=jpg&uid=R77423435&ga=GA1.1.168172065.1675103739'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
