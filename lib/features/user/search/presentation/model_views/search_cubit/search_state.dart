part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<SearchModel> searchList;
  SearchSuccess({required this.searchList});
}

class SearchFailure extends SearchState {
  final String error;
  SearchFailure({required this.error});
}
