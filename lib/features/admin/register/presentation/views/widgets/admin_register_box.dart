import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/admin/register/presentation/model_views/register_cubit.dart';
import 'package:yummy/features/admin/register/presentation/model_views/register_state.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';
import '../../../../login/presentation/views/admin_login_view.dart';
import '../../../../widgets/c_rech_text.dart';
import '../../../../widgets/c_text_form_field.dart';

class AdminRegisterBox extends StatefulWidget {
  const AdminRegisterBox({super.key});

  @override
  State<AdminRegisterBox> createState() => _AdminRegisterBoxState();
}

class _AdminRegisterBoxState extends State<AdminRegisterBox> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<RegisterCubit>(context);
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color: AppColors.greyColor,
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
                Image.asset('assets/images/splash.png',
                    width: 100, height: 100),
                const SizedBox(height: 10),
                CTextFormField(
                  icon: Icons.person_rounded,
                  label: 'userName',
                  controller: _nameController,
                  type: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'UserName is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CTextFormField(
                  icon: Icons.email_rounded,
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
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return const CCircleLoading();
                    }
                    return CExpandedButton(
                      bgColor: AppColors.primaryColor,
                      text: 'Register',
                      textColor: Colors.white,
                      onPress: () async {
                        if (_form.currentState!.validate()) {
                          data
                              .register(
                                  context: context,
                                  userName: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((_) {
                            if (state is RegisterSuccess) {
                              GoRouter.of(context)
                                  .pushReplacement(AdminLoginView.rn);
                            }
                          });
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 5),
                CRechText(
                  rich: 'Already have an account ? ',
                  text: 'LogIn',
                  onPress: () {
                    GoRouter.of(context).pushReplacement(AdminLoginView.rn);
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
