import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;

  const QuantityButton({Key? key, required this.onPress, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: IconButton(
        constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
        onPressed: onPress,
        icon: Icon(icon, size: 19),
      ),
    );
  }
}
