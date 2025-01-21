import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils/styles.dart';

class CExpandedDelete extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  const CExpandedDelete({
    super.key,
    required this.text,
    required this.onPress,
    this.bgColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NeumorphicButton(
        padding: const EdgeInsets.symmetric(vertical: 12),
        style: NeumorphicStyle(
            depth: 2,
            border: NeumorphicBorder(
                color: borderColor ?? AppColors.secondaryColor.withOpacity(0.5),
                width: 1.2),
            color: bgColor ?? Colors.white),
        onPressed: onPress,
        child: Text(
          text,
          style: Styles.title14.copyWith(
            color: textColor ?? AppColors.secondaryColor.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
