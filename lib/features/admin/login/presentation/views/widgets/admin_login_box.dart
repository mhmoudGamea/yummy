import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/features/admin/login/presentation/model_views/login_state.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';
import '../../../../register/presentation/views/admin_register_view.dart';
import '../../../../widgets/c_rech_text.dart';
import '../../../../widgets/c_text_form_field.dart';
import '../../model_views/login_cubit.dart';

class AdminLoginBox extends StatefulWidget {
  const AdminLoginBox({Key? key}) : super(key: key);

  @override
  State<AdminLoginBox> createState() => _AdminLoginBoxState();
}

class _AdminLoginBoxState extends State<AdminLoginBox> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<LoginCubit>(context);
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color: greyColor,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/splash.png', width: 80, height: 80),
                const SizedBox(height: 10),
                CTextFormField(
                  icon: Icons.person_rounded,
                  label: 'Email',
                  controller: _emailController,
                  type: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CTextFormField(
                  icon: Icons.password_rounded,
                  label: 'Password',
                  controller: _passwordController,
                  type: TextInputType.visiblePassword,
                  hidden: true,
                  helper: 'Minimum 6 digits & characters',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Required compination of 6 char & digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: ((context, state) {
                    if (state is LoginLoading) {
                      return const CCircleLoading();
                    } else {
                      return CExpandedButton(
                        bgColor: primaryColor,
                        text: 'LogIn',
                        textColor: Colors.white,
                        onPress: () async {
                          if (_form.currentState!.validate()) {
                            data.login(
                              context: context,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                        },
                      );
                    }
                  }),
                ),
                const SizedBox(height: 5),
                CRechText(
                  rich: 'Doesn\'t have an account ? ',
                  text: 'Register',
                  onPress: () {
                    GoRouter.of(context).pushReplacement(AdminRegisterView.rn);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
