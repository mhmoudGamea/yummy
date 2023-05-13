import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/features/admin/banners/presentation/model_views/banner_cubit/banner_cubit.dart';

import '../../../data/models/banner_model.dart';

class BannerListItem extends StatelessWidget {
  final BannerModel model;
  const BannerListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<BannerCubit>(context);
    return Dismissible(
      key: UniqueKey(),
      background: dismissBackGround(),
      onDismissed: (direction) {
        data.daleteBanner(context, model.id);
      },
      child: SizedBox(
        height: 130,
        width: MediaQuery.of(context).size.width,
        child: Image.network(model.image, fit: BoxFit.cover),
      ),
    );
  }

  Container dismissBackGround() {
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Icon(
        FontAwesomeIcons.trash,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}
