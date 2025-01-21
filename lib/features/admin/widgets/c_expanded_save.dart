import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils/styles.dart';

class CExpandedSave extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color? bgColor;
  final Color? textColor;
  const CExpandedSave({
    super.key,
    required this.text,
    required this.onPress,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NeumorphicButton(
        padding: const EdgeInsets.symmetric(vertical: 12),
        style: NeumorphicStyle(
            depth: 2,
            border: NeumorphicBorder(color: AppColors.babyBlue, width: 1.2),
            color: bgColor ?? AppColors.babyBlue),
        onPressed: onPress,
        child: Text(
          text,
          style: Styles.title14.copyWith(
            color: textColor ?? Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
