import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yummy/core/widgets/c_shimmer.dart';

class FoodImage extends StatelessWidget {
  final String image;
  const FoodImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 270,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CShimmer(
              height: 270,
              width: double.infinity,
            ),
          ),
        )
      ],
    );
  }
}
