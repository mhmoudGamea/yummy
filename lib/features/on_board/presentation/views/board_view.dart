import 'package:flutter/material.dart';

import 'widgets/board_view_body.dart';

class BoardView extends StatelessWidget {
  static const String rn = '/boardView';
  const BoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BoardViewBody();
  }
}
