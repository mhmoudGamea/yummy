import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BannerListItem extends StatelessWidget {
  final String image;
  const BannerListItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: dismissBackGround(),
      onDismissed: (direction) {},
      child: SizedBox(
        height: 130,
        width: MediaQuery.of(context).size.width,
        child: Image.network(image, fit: BoxFit.cover),
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
/*

https://marketplace.canva.com/EAFVfgsKMAE/1/0/1600w/canva-black-and-yellow-simple-minimalist-burger-promotion-banner-YTqWS2eL8TM.jpg



https://marketplace.canva.com/EAE_zuTcURg/1/0/1600w/canva-black-modern-super-big-pizza-food-promotion-banner-F_sFHlsLraM.jpg



https://marketplace.canva.com/EAFanHj4_og/1/0/1600w/canva-yellow-red-modern-food-promotion-banner-landscape-D5j43WWUmtA.jpg
*/