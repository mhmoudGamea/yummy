import 'package:flutter/material.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/utils/styles.dart';

class CExpandedText extends StatefulWidget {
  final String text;
  const CExpandedText({super.key, required this.text});

  @override
  CExpandedTextState createState() => CExpandedTextState();
}

class CExpandedTextState extends State<CExpandedText> {
  late String firstHalf;
  late String lastHalf;
  var expanded = false;

  @override
  void initState() {
    if (widget.text.length > 120) {
      firstHalf = widget.text.substring(0, 120);
      lastHalf = widget.text.substring(121, widget.text.length);
    } else {
      firstHalf = widget.text;
      lastHalf = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return lastHalf.isEmpty
        ? Text(
            firstHalf,
            style: Styles.title14
                .copyWith(color: AppColors.greyColor2, letterSpacing: 0.6),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expanded ? widget.text : firstHalf,
                style: Styles.title14
                    .copyWith(color: AppColors.greyColor2, letterSpacing: 0.6),
              ),
              const SizedBox(height: 3),
              GestureDetector(
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      expanded ? 'Show Less' : 'Show More',
                      style: Styles.title14.copyWith(
                          color: AppColors.primaryColor, letterSpacing: 0.6),
                    ),
                    Icon(
                      expanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
            ],
          );
  }
}
