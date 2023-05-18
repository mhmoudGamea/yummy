import 'package:flutter/material.dart';
import 'package:yummy/core/utils/styles.dart';

class CItemName extends StatelessWidget {
  final String text;
  const CItemName({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Text(
        text,
        style: Styles.title15.copyWith(overflow: TextOverflow.ellipsis),
        maxLines: 2,
      ),
    );
  }
}
