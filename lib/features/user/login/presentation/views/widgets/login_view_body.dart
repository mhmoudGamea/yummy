import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';
import '../../../../../../core/widgets/c_text_form_field.dart';
import '../../../../../welcome/data/models/location_model.dart';
import '../../model_views/login_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  final LocationModel? locationModel;
  const LoginViewBody({super.key, this.locationModel});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var _isValidMobileNumber = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<LoginCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Login', style: Styles.title16.copyWith(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Enter your number to process.',
                style: Styles.title14.copyWith(color: AppColors.greyColor2)),
            const SizedBox(height: 15),
            CTextFormField(
              type: TextInputType.number,
              autoFocus: true,
              controller: _controller,
              onChange: (value) {
                if (value.length == 11) {
                  setState(() {
                    _isValidMobileNumber = true;
                  });
                } else {
                  setState(() {
                    _isValidMobileNumber = false;
                  });
                }
              },
            ),
            const SizedBox(height: 15),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is InvalidOTP || state is LoginFailed) {
                  setState(() {
                    _isValidMobileNumber = false;
                  });
                }
              },
              builder: (context, state) {
                // print(state);
                return AbsorbPointer(
                  absorbing: _isValidMobileNumber ? false : true,
                  child: state is LoginLoading
                      ? const CCircleLoading()
                      : CExpandedButton(
                          text: _isValidMobileNumber
                              ? 'Continue'
                              : 'Enter Phone Number',
                          bgColor: _isValidMobileNumber
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                          onPress: () async {
                            // to close keyboard
                            FocusManager.instance.primaryFocus!.unfocus();
                            String number = '+20${_controller.text}';
                            data
                                .signinUserWithPhoneNumber(
                                  context: context,
                                  number: number,
                                )
                                .then((value) => _controller.clear());
                          },
                          textColor: Colors.white,
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
