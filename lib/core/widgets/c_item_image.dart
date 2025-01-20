import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CItemImage extends StatelessWidget {
  final String image;
  const CItemImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
