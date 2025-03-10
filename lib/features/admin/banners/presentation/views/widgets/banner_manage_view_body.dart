import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/admin/banners/data/models/banner_model.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_error_widget.dart';
import '../../model_views/banner_cubit/banner_cubit.dart';
import 'banner_dialog.dart';
import 'banner_list_item.dart';

class BannerManageViewBody extends StatelessWidget {
  const BannerManageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final banner = BlocProvider.of<BannerCubit>(context);
    final store = GetIt.I.get<FirebaseFirestore>();
    var loading = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          BlocConsumer<BannerCubit, BannerState>(
            listener: (context, state) {
              if (state is UploadImageLoading) {
                loading = true;
              } else {
                loading = false;
              }
            },
            builder: (context, state) {
              return Row(
                children: [
                  const Spacer(),
                  loading
                      ? const CCircleLoading()
                      : Text(
                          'Add or Swipe to delete banner',
                          style: Styles.title14,
                        ),
                  const Spacer(),
                  AbsorbPointer(
                    absorbing: loading ? true : false,
                    child: IconButton(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      constraints: const BoxConstraints(),
                      icon: Icon(FontAwesomeIcons.plus,
                          size: 18, color: AppColors.primaryColor),
                      onPressed: () {
                        banner.pickBanner().then(
                              (_) => showDialog(
                                context: context,
                                builder: (context) {
                                  return BlocProvider<BannerCubit>.value(
                                    value: banner,
                                    child: const BannerDialog(),
                                  );
                                },
                              ),
                            );
                      },
                    ),
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 3,
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: 10),
          StreamBuilder<QuerySnapshot>(
            stream: store.collection('banners').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CCircleLoading();
              } else if (snapshot.hasData) {
                List<BannerModel> banners = [];
                for (var element in snapshot.data!.docs) {
                  banners.add(BannerModel.fromJson(
                      element.data() as Map<String, dynamic>));
                }
                if (banners.isEmpty) {
                  return CErrorWidget(
                      text:
                          'Start to add a new banner by click on add banner button.',
                      icon: FontAwesomeIcons.faceSmile,
                      bgColor: AppColors.primaryColor);
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: banners.length,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (context, index) =>
                        BannerListItem(model: banners[index]),
                  ),
                );
              }
              return const CErrorWidget(
                  text: 'Sorry we have no banners for now for you.',
                  icon: FontAwesomeIcons.xmark);
            },
          ),
        ],
      ),
    );
  }
}
