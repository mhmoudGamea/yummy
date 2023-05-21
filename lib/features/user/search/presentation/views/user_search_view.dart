import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/search/presentation/model_views/search_cubit/search_cubit.dart';

import '../../../../../core/utils/helper.dart';
import 'widgets/user_search_view_body.dart';

class UserSearchView extends StatelessWidget {
  const UserSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: Helper.appBar(
          context: context,
          text: 'Search',
          bgColor: Colors.white,
          textColor: Colors.black,
          iconColor: Colors.red,
          leading: false,
          elevation: 2,
        ),
        body: const SafeArea(
          child: UserSearchViewBody(),
        ),
      ),
    );
  }
}
