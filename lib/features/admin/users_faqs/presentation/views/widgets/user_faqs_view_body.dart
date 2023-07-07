import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';

class UserFaqsViewBody extends StatelessWidget {
  const UserFaqsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var loading = false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              // loading
              //     ? const CCircleLoading()
              //     : const
              const Text(
                'Add or swipe to delete faq',
                style: Styles.title14,
              ),
              const Spacer(),
              AbsorbPointer(
                // absorbing: loading ? true : false,
                child: IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  constraints: const BoxConstraints(),
                  icon: const Icon(FontAwesomeIcons.plus,
                      size: 18, color: primaryColor),
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => BlocProvider.value(
                    //     value: food,
                    //     child: const FoodDialog(),
                    //   ),
                    // );
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 3,
            color: primaryColor,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
