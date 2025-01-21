import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../utils/styles.dart';

class CButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final VoidCallback onPress;
  const CButton({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    required this.bgColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(depth: 1, color: bgColor),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      onPressed: onPress,
      child: Text(
        text,
        style: Styles.title15.copyWith(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
