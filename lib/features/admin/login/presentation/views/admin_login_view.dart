import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/constants.dart';

import '../../../../../core/utils/helper.dart';
import '../../data/repos/login_repo_impl.dart';
import '../model_views/login_cubit.dart';
import 'widgets/admin_login_view_body.dart';

class AdminLoginView extends StatelessWidget {
  static const String rn = '/adminLoginView';
  const AdminLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl()),
      child: Scaffold(
        appBar: Helper.appBar(
            context: context,
            text: 'Yummy App Admin Dashboard',
            bgColor: primaryColor),
        body: const SafeArea(
          child: AdminLoginViewBody(),
        ),
      ),
    );
  }
}
