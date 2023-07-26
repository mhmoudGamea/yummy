import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PaymentButton extends StatelessWidget {
  final String image;
  final VoidCallback onPress;
  const PaymentButton({Key? key, required this.image, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NeumorphicButton(
            padding: const EdgeInsets.all(15),
            style: const NeumorphicStyle(
                depth: 3, intensity: 4, color: Colors.white),
            onPressed: onPress,
            child: Image.asset(
              image,
              height: 20,
            ),
          ),
        )
      ],
    );
  }
}
