import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/constants.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onPress;
  const DrawerItem({
    Key? key,
    required this.text,
    required this.icon,
    this.textColor = greyColor2,
    this.iconColor = black,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 15),
      style: NeumorphicStyle(
        color: primaryColor.withOpacity(0.5),
        depth: 2,
      ),
      onPressed: onPress,
      child: Row(
        children: [
          Icon(
            icon,
            size: 15,
            color: iconColor,
          ),
          const SizedBox(width: 15),
          Text(
            text.toUpperCase(),
            style:
                Styles.title13.copyWith(letterSpacing: 1.1, color: textColor),
          )
        ],
      ),
    );
  }
}
