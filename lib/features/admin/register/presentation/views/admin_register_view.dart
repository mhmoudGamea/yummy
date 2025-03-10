import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/utils/helper.dart';
import '../../data/repos/register_repo_impl.dart';
import '../model_views/register_cubit.dart';
import 'widgets/admin_register_view_body.dart';

class AdminRegisterView extends StatelessWidget {
  static const String rn = '/adminRegisterView';
  const AdminRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterRepoImpl()),
      child: Scaffold(
        appBar: Helper.appBar(
            context: context,
            text: 'Yummy App Admin',
            bgColor: AppColors.primaryColor),
        body: const SafeArea(
          child: AdminRegisterViewBody(),
        ),
      ),
    );
  }
}
