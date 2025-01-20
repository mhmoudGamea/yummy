import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';

import '../../model_views/banner_cubit/banner_cubit.dart';

class BannerDialog extends StatelessWidget {
  const BannerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final banner = BlocProvider.of<BannerCubit>(context);
    return Dialog(
      elevation: 2,
      shadowColor: greyColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<BannerCubit, BannerState>(
              builder: (context, state) {
                return Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: banner.getPickedImage == null
                      ? const Icon(
                          FontAwesomeIcons.image,
                          size: 100,
                          color: greyColor,
                        )
                      : Image.file(
                          banner.getPickedImage!,
                          fit: BoxFit.cover,
                        ),
                );
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: NeumorphicButton(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    style: NeumorphicStyle(
                        border: NeumorphicBorder(
                            color: secondaryColor.withOpacity(0.5), width: 1.2),
                        color: Colors.white),
                    child: Text(
                      'Delete',
                      style: Styles.title13.copyWith(
                        color: secondaryColor.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      banner.deletePickedImage();
                      GoRouter.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 15),
                BlocBuilder<BannerCubit, BannerState>(
                  builder: (context, state) {
                    if (state is UploadImageLoading) {
                      return Expanded(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: const CCircleLoading()));
                    }
                    return Expanded(
                      child: NeumorphicButton(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        style: const NeumorphicStyle(
                            border:
                                NeumorphicBorder(color: babyBlue, width: 1.2),
                            color: babyBlue),
                        child: Text(
                          'Save',
                          style: Styles.title13.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          banner.uploadBanner(context);
                          GoRouter.of(context).pop();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
