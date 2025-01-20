import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/favourite/presentation/model_views/favourite/favourite_cubit.dart';
import 'package:yummy/features/user/search/data/repos/seacrh_repo_impl.dart';
import 'package:yummy/features/user/search/presentation/model_views/search_cubit/search_cubit.dart';

import '../../../../../core/utils/helper.dart';
import 'widgets/user_search_view_body.dart';

class UserSearchView extends StatelessWidget {
  const UserSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchCubit(SearchRepoImpl())),
        BlocProvider(create: (context) => FavouriteCubit()),
      ],
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
