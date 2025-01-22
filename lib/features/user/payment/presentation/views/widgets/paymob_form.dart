import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/core/widgets/c_expanded_button.dart';
import 'package:yummy/features/user/payment/data/paymob_model/paymob_user_info.dart';
import 'package:yummy/features/user/payment/presentation/model-views/paymob/paymob_cubit.dart';
import 'package:yummy/features/user/payment/presentation/views/widgets/paymob_webview.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../admin/widgets/c_text_form_field.dart';

class PaymobForm extends StatefulWidget {
  final String total;
  const PaymobForm({super.key, required this.total});

  @override
  State<PaymobForm> createState() => _PaymobFormState();
}

class _PaymobFormState extends State<PaymobForm> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<PaymobCubit>(context);
    var loading = false;
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
                Row(
                  children: [
                    Expanded(
                      child: CTextFormField(
                          label: 'First Name*',
                          type: TextInputType.name,
                          controller: _firstNameController,
                          icon: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: CTextFormField(
                          label: 'Last Name*',
                          type: TextInputType.name,
                          controller: _lastNameController,
                          icon: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CTextFormField(
                    label: 'Email*',
                    type: TextInputType.emailAddress,
                    controller: _emailController,
                    icon: Icons.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                CTextFormField(
                    label: 'Phone*',
                    type: TextInputType.number,
                    controller: _phoneController,
                    icon: Icons.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    }),
                const SizedBox(height: 25),
                BlocConsumer<PaymobCubit, PaymobState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      loading = false;
                      GoRouter.of(context).pushReplacement(PaymobWebview.rn);
                    } else if (state is RegisterFailure) {
                      //PaymobAuthenticationFailure || PaymobOrderRegistrationFailure || PaymobPaymentRequestFailure
                      loading = false;
                    } else {
                      loading = true;
                    }
                  },
                  builder: (context, state) {
                    return loading
                        ? const Center(child: CCircleLoading())
                        : CExpandedButton(
                            text: 'Register',
                            bgColor: AppColors.primaryColor,
                            textColor: Colors.white,
                            onPress: () {
                              if (_form.currentState!.validate()) {
                                data.registerForPaymobPayment(
                                    totalPrice: widget.total,
                                    paymobUserInfo: PaymobUserInfo(
                                        firstName: _firstNameController.text,
                                        lastName: _lastNameController.text,
                                        email: _emailController.text,
                                        phone: _phoneController.text));
                              }
                            });
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
