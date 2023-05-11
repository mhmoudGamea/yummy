import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../core/widgets/c_error_widget.dart';
import '../../model_views/banner_cubit/banner_cubit.dart';

class CCurosalSlider extends StatelessWidget {
  const CCurosalSlider({Key? key}) : super(key: key);

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
                  icon: Icons.close_rounded,
                  text: 'Sorry we can\'t find any banners for now.');
            } else {
              return CarouselSlider(
                items: snapshot.data!.docs.map(
                  (e) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        e['image'],
                        fit: BoxFit.fill,
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
