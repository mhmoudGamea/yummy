import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yummy/core/constants.dart';

import '../utils/styles.dart';

class CTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPress;
  final Alignment align;
  final double size;
  const CTextButton({
    Key? key,
    required this.text,
    this.textColor = black,
    required this.onPress,
    required this.align,
    this.size = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: Styles.title15.copyWith(color: textColor, fontSize: size),
        ),
      ),
    );
  }
}
