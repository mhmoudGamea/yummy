import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/core/widgets/c_error_widget.dart';
import 'package:yummy/features/user/profile/presentation/model-views/faq_cubit.dart/faq_cubit.dart';
import 'package:yummy/features/user/profile/presentation/model-views/faq_cubit.dart/faq_state.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../data/faq_model.dart';

class FaqViewBody extends StatelessWidget {
  const FaqViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqCubit, FaqState>(
      builder: (context, state) {
        if (state is FaqSuccess) {
          return ListView.builder(
            itemCount: state.faqs.length,
            itemBuilder: (context, index) {
              return ListItem(faqs: state.faqs, index: index);
            },
          );
        } else {
          return CErrorWidget(
              icon: FontAwesomeIcons.triangleExclamation,
              text: 'Sorry, unexpected error happen.',
              bgColor: AppColors.secondaryColor);
        }
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.faqs,
    required this.index,
  });
  final List<FaqModel> faqs;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: PageStorageKey<int>(index),
      title: Text(faqs[index].question, style: Styles.title15),
      collapsedIconColor: AppColors.primaryColor,
      iconColor: AppColors.primaryColor,
      trailing: Icon(
        faqs[index].isExpanded ? Icons.remove : Icons.add,
      ),
      onExpansionChanged: (bool expanded) {
        context.read<FaqCubit>().toggleExpanded(expanded, index);
      },
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 0, bottom: 10, left: 16, right: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              faqs[index].answer,
              style: Styles.title14.copyWith(color: AppColors.greyColor2),
            ),
          ),
        ),
      ],
    );
  }
}
