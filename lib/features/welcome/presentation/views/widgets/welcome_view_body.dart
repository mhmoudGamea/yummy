import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/c_button.dart';
import '../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../core/widgets/c_text_button.dart';
import '../../../../admin/login/presentation/views/admin_login_view.dart';
import '../../../../on_board/presentation/views/board_view.dart';
import '../../../../register/login/presentation/login_view.dart';
import '../../model_views/location_cubit/location_cubit.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({Key? key}) : super(key: key);

  void openModelSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LoginView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<LocationCubit>(context);

    return Stack(
      children: [
        Column(
          children: [
            const Expanded(
              child: BoardView(),
            ),
            const SizedBox(height: 10),
            const Text('Ready to order from your nearest resturant ?',
                style: Styles.title14),
            const SizedBox(height: 20),
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state is LocationLoading) {
                  return const CCircleLoading();
                } else {
                  return CButton(
                    text: 'Set Delivery Location',
                    textColor: Colors.white,
                    bgColor: primaryColor,
                    onPress: () async {
                      await data.getCurrentDeviceLocation(context);
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              child: RichText(
                text: TextSpan(
                  text: 'Already a customer ? ',
                  style: Styles.title14.copyWith(color: greyColor2),
                  children: [
                    TextSpan(
                        text: 'LogIn',
                        style: Styles.title15.copyWith(color: primaryColor)),
                  ],
                ),
              ),
              onPressed: () {
                openModelSheet(context);
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
        Positioned(
          top: 10,
          right: 10,
          child: CTextButton(
            text: 'Admin Login',
            align: Alignment.topRight,
            textColor: primaryColor,
            size: 15,
            onPress: () {
              GoRouter.of(context).push(AdminLoginView.rn);
            },
          ),
        ),
      ],
    );
  }
}
