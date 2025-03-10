import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/widgets/c_error_widget.dart';
import '../../model_views/search_cubit/search_cubit.dart';
import 'c_header.dart';
import 'c_people_are_looking_stream.dart';
import 'c_popular_food_stream.dart';
import 'c_search_list.dart';

class SearchViewBodyBuilder extends StatelessWidget {
  const SearchViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CHeader(headerName: 'Popular Food'),
                    SizedBox(height: 10),
                    CPopularFoodStream(),
                    SizedBox(height: 25),
                    CHeader(headerName: 'People are looking'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: CPeopleAreLookingStream(),
              ),
            ],
          );
        } else if (state is SearchFailure) {
          return CErrorWidget(
              icon: FontAwesomeIcons.triangleExclamation,
              text: state.error,
              bgColor: AppColors.secondaryColor);
        } else if (state is SearchSuccess) {
          return CSearchList(searchList: state.searchList);
        }
        return const SizedBox();
      },
    );
  }
}
