import 'package:flutter/material.dart';
import 'package:yummy/features/user/search/data/models/search_model.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/c_item_rate.dart';
import '../../../../favourite/presentation/views/widgets/c_item_image.dart';
import '../../../../favourite/presentation/views/widgets/c_item_name.dart';

class CSearchListItem extends StatelessWidget {
  final SearchModel model;
  const CSearchListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          CItemImage(image: model.foodImage),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CItemName(text: model.name),
              const SizedBox(height: 8),
              CItemRate(rate: model.rate, rateColor: Colors.black)
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
