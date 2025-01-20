import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/search/presentation/views/widgets/search_view_body_builder.dart';

import '../../model_views/search_cubit/search_cubit.dart';
import 'c_search_field.dart';

class UserSearchViewBody extends StatelessWidget {
  const UserSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final search = BlocProvider.of<SearchCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CSearchField(
              controller: search.getSearchController,
              onPress: () {
                search.searchItems(context);
              }),
          const SizedBox(height: 25),
          const Expanded(child: SearchViewBodyBuilder()),
        ],
      ),
    );
  }
}
/*



*/
