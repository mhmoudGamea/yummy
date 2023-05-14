import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../core/constants.dart';
import '../../../core/utils/styles.dart';

class CExpandedDelete extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  const CExpandedDelete({
    Key? key,
    required this.text,
    required this.onPress,
    this.bgColor,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NeumorphicButton(
        padding: const EdgeInsets.symmetric(vertical: 12),
        style: NeumorphicStyle(
            border: NeumorphicBorder(
                color: borderColor ?? secondaryColor.withOpacity(0.5),
                width: 1.2),
            color: bgColor ?? Colors.white),
        onPressed: onPress,
        child: Text(
          text,
          style: Styles.title14.copyWith(
            color: textColor ?? secondaryColor.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
