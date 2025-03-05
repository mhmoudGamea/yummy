import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CloseDrawer extends StatelessWidget {
  const CloseDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Scaffold.of(context).closeDrawer();
        },
        icon: Icon(FontAwesomeIcons.xmark, size: 21),
        color: Colors.white);
  }
}
