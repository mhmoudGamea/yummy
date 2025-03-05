import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';
import '../../../../../admin/widgets/c_text_form_field.dart';
import '../../../../home/presentation/model_views/cart_cubit/cart_cubit.dart';
import '../../../data/paypal_model/address_model.dart';
import '../../../data/paypal_model/order_model.dart';
import '../../model-views/paypal/paypal_cubit.dart';
import '../../model-views/paypal/paypal_state.dart';
import '../payment_success_view.dart';

class PaypalForm extends StatefulWidget {
  final OrderModel orderModel;
  const PaypalForm({super.key, required this.orderModel});

  @override
  State<PaypalForm> createState() => _PaymobFormState();
}

class _PaymobFormState extends State<PaypalForm> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final paypalCubit = BlocProvider.of<PaypalCubit>(context);
    paypalCubit.stream.listen((state) {
      if (state is AddressSuccess) {
        _countryController.text = state.country;
        _stateController.text = state.state;
        _cityController.text = state.city;
        _streetController.text = state.street;
        _zipController.text = state.zip;
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
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
          autovalidateMode: _autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CTextFormField(
                    label: 'Full Name*',
                    type: TextInputType.name,
                    controller: _nameController,
                    icon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required Name Field';
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                CTextFormField(
                    label: 'Email*',
                    type: TextInputType.emailAddress,
                    controller: _emailController,
                    icon: Icons.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required Email Field';
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                CTextFormField(
                    label: 'Country*',
                    type: TextInputType.name,
                    controller: _countryController,
                    icon: Icons.location_city,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required Country Field';
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                CTextFormField(
                    label: 'State*',
                    type: TextInputType.name,
                    controller: _stateController,
                    icon: Icons.location_city,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required State Field';
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                CTextFormField(
                    label: 'City*',
                    type: TextInputType.name,
                    controller: _cityController,
                    icon: Icons.location_city,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required City Field';
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                CTextFormField(
                    label: 'Street*',
                    type: TextInputType.name,
                    controller: _streetController,
                    icon: Icons.location_city,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required Street Field';
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                CTextFormField(
                    label: 'Zip*',
                    type: TextInputType.number,
                    controller: _zipController,
                    icon: Icons.code,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required Zip Field';
                      }
                      return null;
                    }),
                const SizedBox(height: 25),
                BlocBuilder<PaypalCubit, PaypalState>(
                  builder: (context, state) {
                    if (state is AddressLoading) {
                      return Center(
                          child: CCircleLoading(
                        color: AppColors.primaryColor3,
                      ));
                    } else if (state is AddressSuccess) {
                      return CExpandedButton(
                        text: 'Address Detected',
                        bgColor: AppColors.primaryColor3,
                        textColor: Colors.white,
                        onPress: () {
                          context.read<PaypalCubit>().getUserAddress();
                        },
                      );
                    }
                    return CExpandedButton(
                      text: state is AddressError
                          ? 'Failed to Detect Address'
                          : 'Detect My Address',
                      bgColor: AppColors.primaryColor3,
                      textColor: Colors.white,
                      onPress: () {
                        context.read<PaypalCubit>().getUserAddress();
                      },
                    );
                  },
                ),
                const SizedBox(height: 15),
                BlocConsumer<PaypalCubit, PaypalState>(
                  listener: (context, state) {
                    if (state is PaypalSuccess) {
                      FocusManager.instance.primaryFocus!.unfocus();
                      GoRouter.of(context).push(PaymentSuccessView.rn,
                          extra: widget.orderModel.orderId);
                      cartCubit.clearCart();
                      //TODO: you can go to map to make user follow the order
                    }
                  },
                  builder: (context, state) {
                    if (state is PaypalLoading) {
                      return Center(child: CCircleLoading());
                    }
                    return CExpandedButton(
                        text: state is PaypalError
                            ? 'Try Again Later'
                            : 'Pay with paypal',
                        bgColor: AppColors.primaryColor,
                        textColor: Colors.white,
                        onPress: () {
                          if (_form.currentState!.validate()) {
                            _form.currentState!.save();

                            widget.orderModel.orderDate =
                                DateTime.now().toString();
                            widget.orderModel.addressModel = AddressModel(
                              name: _nameController.text,
                              email: _emailController.text,
                              country: _countryController.text,
                              state: _stateController.text,
                              city: _cityController.text,
                              street: _streetController.text,
                              zip: _zipController.text,
                            );
                            context.read<PaypalCubit>().paymentWithPaypal(
                                context,
                                OrderModel.toOrderEntity(widget.orderModel));
                          } else {
                            _autovalidateMode = AutovalidateMode.always;
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
