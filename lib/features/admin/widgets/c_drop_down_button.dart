import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../core/constants.dart';
import '../../../core/utils/helper.dart';

class CDropDownButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String selectedValue;
  final List<DropdownMenuItem> items;
  final Function(dynamic)? onPress;
  const CDropDownButton(
      {Key? key,
      required this.label,
      required this.icon,
      required this.onPress,
      required this.selectedValue,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Styles.title14.copyWith(color: primaryColor),
        enabledBorder: Helper.border(borderColor: primaryColor),
        border: Helper.border(borderColor: primaryColor),
        focusedBorder: Helper.border(borderColor: primaryColor),
        prefixIcon: Icon(
          icon,
          size: 15,
          color: primaryColor,
        ),
      ),
      value: selectedValue,
      items: items,
      icon: const Icon(
        FontAwesomeIcons.circleArrowDown,
        size: 18,
        color: primaryColor,
      ),
      elevation: 2,
      onChanged: onPress,
    );
  }
}
/*

return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Styles.title14.copyWith(color: primaryColor),
        enabledBorder: Helper.border(borderColor: primaryColor),
        border: Helper.border(borderColor: primaryColor),
        focusedBorder: Helper.border(borderColor: primaryColor),
        prefixIcon: Icon(
          icon,
          size: 15,
          color: primaryColor,
        ),
      ),
      value: food.getSelectedCategory,
      items: food.convert(),
      icon: const Icon(
        FontAwesomeIcons.circleArrowDown,
        size: 18,
        color: primaryColor,
      ),
      elevation: 2,
      onChanged: (value) {
        food.setSelectedCategory = value;
      },
    );
*/