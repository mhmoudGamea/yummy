import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/user/favourite/presentation/model_views/favourite/favourite_cubit.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/c_item_rate.dart';
import '../../../../../../core/widgets/c_rounded_button.dart';
import '../../../data/models/favourite_model.dart';
import 'c_item_category.dart';
import 'c_item_image.dart';
import 'c_item_name.dart';

class CListViewItem extends StatefulWidget {
  final FavouriteModel model;
  const CListViewItem({Key? key, required this.model}) : super(key: key);

  @override
  State<CListViewItem> createState() => _CListViewItemState();
}

class _CListViewItemState extends State<CListViewItem> {
  FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
  var _isLiked = false;

  @override
  void didChangeDependencies() {
    if (widget.model.favourites.contains(auth.currentUser!.uid)) {
      setState(() {
        _isLiked = true;
      });
    } else {
      setState(() {
        _isLiked = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final favourite = BlocProvider.of<FavouriteCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0.1, 0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          CItemImage(image: widget.model.foodImage),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CItemCategory(categoryName: widget.model.category),
              const SizedBox(height: 2),
              CItemName(text: widget.model.name),
              const SizedBox(height: 8),
              CItemRate(rate: widget.model.rate, rateColor: Colors.black)
            ],
          ),
          const Spacer(),
          CRoundedButton(
            onTap: () {
              setState(() {
                _isLiked = !_isLiked;
              });
              favourite.addToFavourite(model: widget.model, isLiked: _isLiked);
            },
            icon: Icons.favorite_rounded,
            iconSize: 20,
            opacity: 0.13,
            color: _isLiked ? secondaryColor : greyColor,
          )
        ],
      ),
    );
  }
}
