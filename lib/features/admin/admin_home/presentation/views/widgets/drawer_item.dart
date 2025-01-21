import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/config/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onPress;
  const DrawerItem({
    super.key,
    required this.text,
    required this.icon,
    this.textColor = Colors.black38,
    this.iconColor = Colors.black,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 15),
      style: NeumorphicStyle(
        color: AppColors.primaryColor.withOpacity(0.5),
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
