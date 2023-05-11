import 'package:flutter/material.dart';
import 'package:yummy/core/utils/styles.dart';

class CHeaderName extends StatelessWidget {
  final String name;
  const CHeaderName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Text(
        name,
        style: Styles.title15
            .copyWith(fontWeight: FontWeight.bold, letterSpacing: .9),
        textAlign: TextAlign.start,
      ),
    );
  }
}
