import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/profile/presentation/model-views/faq_cubit.dart/faq_cubit.dart';

import '../../../../../core/utils/helper.dart';
import 'widgets/faq/faq_view_body.dart';

class FaqView extends StatelessWidget {
  static const rn = '/faq_view';
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.appBar(
        context: context,
        text: 'FAQ',
        bgColor: Colors.white,
        textColor: Colors.black,
        leading: true,
        iconColor: Colors.black,
        elevation: 2,
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => FaqCubit()..getFAQ(),
          child: FaqViewBody(),
        ),
      ),
    );
  }
}
