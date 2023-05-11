import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yummy/core/constants.dart';

import '../utils/styles.dart';

class CExpandedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final VoidCallback onPress;
  const CExpandedButton({
    Key? key,
    required this.text,
    this.textColor = black,
    required this.bgColor,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: NeumorphicButton(
            padding: const EdgeInsets.symmetric(vertical: 13),
            style: NeumorphicStyle(depth: 1, color: bgColor),
            onPressed: onPress,
            child: Text(
              text,
              style: Styles.title15.copyWith(color: textColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
