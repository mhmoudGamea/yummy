import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/widgets/c_item_rate.dart';
import 'package:yummy/features/user/home/data/data/user_food_model.dart';
import 'package:yummy/core/widgets/c_rounded_button.dart';
import 'package:yummy/features/user/home/presentation/model_views/home_cubit/home_cubit.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/c_category_food_box.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/c_food_image_box.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/c_gradient_layer.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/text_13.dart';

class CListItem extends StatefulWidget {
  final UserFoodModel model;
  const CListItem({Key? key, required this.model}) : super(key: key);

  @override
  State<CListItem> createState() => _CListItemState();
}

class _CListItemState extends State<CListItem> {
  FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
  var _isLiked = false;

  @override
  void didChangeDependencies() {
    if (widget.model.favourites.contains(auth.currentUser!.uid)) {
      _isLiked = true;
    } else {
      _isLiked = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final food = BlocProvider.of<HomeCubit>(context);
    return Stack(
      children: [
        CFoodImageBox(image: widget.model.foodImage, width: 180, height: 260),
        const CGradientLayer(width: 180, height: 260),
        Positioned(
          top: 15,
          left: 12,
          child: CCategoryFoodBox(categoryName: widget.model.category),
        ),
        Positioned(
          bottom: 50,
          left: 12,
          child: SizedBox(
            width: 120,
            child: Text(
              widget.model.name,
              style: Styles.title16
                  .copyWith(color: Colors.white, overflow: TextOverflow.fade),
              maxLines: 3,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 12,
          child: SizedBox(
            width: 120,
            child: Row(
              children: [
                Text13(
                    text: '${widget.model.prepareTime} Min',
                    color: Colors.white),
                const SizedBox(width: 4),
                const Text13(text: '|', color: Colors.white),
                const SizedBox(width: 4),
                CItemRate(rate: widget.model.rate, rateColor: Colors.white),
              ],
            ),
          ),
        ),
        Positioned(
          right: 12,
          bottom: 20,
          child: CRoundedButton(
            icon: Icons.favorite,
            color: _isLiked &&
                    widget.model.favourites.contains(auth.currentUser!.uid)
                ? Colors.red
                : Colors.white,
            onTap: () {
              setState(() {
                _isLiked = !_isLiked;
              });
              food.addToFavourite(model: widget.model, isLiked: _isLiked);
            },
          ),
        ),
      ],
    );
  }
}
