import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../welcome/data/models/location_model.dart';
import '../model_views/login_cubit/login_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const String rn = '/loginView';
  final LocationModel? locationModel; // lat, long & address
  const LoginView({super.key, this.locationModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: LoginViewBody(locationModel: locationModel),
        ),
      ),
    );
  }
}
