import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_error_widget.dart';
import '../../model_views/banner_cubit/banner_cubit.dart';
import 'banner_list_item.dart';

class BannerManageViewBody extends StatelessWidget {
  const BannerManageViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          const Row(
            children: [
              Spacer(),
              Text(
                'Add or Swipe to delete banner',
                style: Styles.title14,
              ),
              Spacer(),
              Icon(FontAwesomeIcons.plus, size: 18, color: primaryColor)
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 3,
            color: primaryColor,
          ),
          const SizedBox(height: 10),
          BlocBuilder<BannerCubit, BannerState>(
            builder: (context, state) {
              print(state);
              if (state is BannerSuccess) {
                if (state.banners.isEmpty) {
                  return CErrorWidget(
                      text:
                          'Start to add a new banner by click on add banner button.',
                      icon: FontAwesomeIcons.faceSmile,
                      bgColor: primaryColor);
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.banners.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (context, index) =>
                        BannerListItem(image: state.banners[index]),
                  ),
                );
              } else if (state is BannerFailure) {
                return CErrorWidget(
                    text: 'Sorry we have no banners for now for you.',
                    icon: FontAwesomeIcons.xmark);
              }
              return const CCircleLoading();
            },
          ),
        ],
      ),
    );
  }
}
