import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model_views/banner_cubit/banner_cubit.dart';

import '../../../../../../core/utils/helper.dart';
import '../../../data/models/banner_model.dart';

class BannerListItem extends StatelessWidget {
  final BannerModel model;
  const BannerListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<BannerCubit>(context);
    return Dismissible(
      key: UniqueKey(),
      background: Helper.dismissBackGround(),
      direction: DismissDirection.endToStart,
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
}
