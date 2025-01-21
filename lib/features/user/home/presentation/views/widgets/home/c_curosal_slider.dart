import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../../core/widgets/c_error_widget.dart';
import '../../../model_views/banner_cubit/banner_cubit.dart';

class CCurosalSlider extends StatelessWidget {
  const CCurosalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<BannerCubit>(context);
    final store = GetIt.I.get<FirebaseFirestore>();
    return Column(
      children: [
        StreamBuilder(
          stream: store.collection('banners').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 150,
                child: Center(child: CCircleLoading()),
              );
            } else if (snapshot.hasError) {
              return CErrorWidget(
                  icon: Icons.close_rounded, text: '${snapshot.error}');
            } else {
              if (snapshot.data!.docs.isEmpty) {
                return SizedBox(
                  height: 150,
                  child: Center(
                    child: CErrorWidget(
                      icon: FontAwesomeIcons.triangleExclamation,
                      text: 'No banner to display yet.',
                      bgColor: AppColors.primaryColor,
                    ),
                  ),
                );
              }
              return CarouselSlider(
                items: snapshot.data!.docs.map(
                  (e) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          e['image'],
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: .85,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  // autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    data.setCurrentBannerIndex = index;
                  },
                  // on
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
