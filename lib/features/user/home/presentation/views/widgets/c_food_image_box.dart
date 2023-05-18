import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/c_shimmer.dart';

class CFoodImageBox extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  const CFoodImageBox(
      {Key? key,
      required this.image,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const CShimmer(height: 260, width: 180),
        ),
      ),
    );
  }
}
