import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/search/data/models/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  // final List<UserFoodModel> _foods = [];

  // List<UserFoodModel> get getListFoods {
  //   return _foods;
  // }

  // Future<void> getUserFood(String categoryName) async {
  //   emit(UserFoodLoading());
  //   _store.collection('food').snapshots().listen((event) {
  //     _foods.clear();
  //     final categoryList =
  //         event.docs.where((docs) => docs['category'] == categoryName);
  //     for (var doc in categoryList) {
  //       _foods.add(UserFoodModel.fromJson(doc.data()));
  //     }
  //   }, onError: (_) => emit(UserFoodFailure()));
  // }

  // final TextEditingController _searchController = TextEditingController();

  // TextEditingController get getSearchController {
  //   return _searchController;
  // }

  // get popular food list
  final List<SearchModel> _popularFoodList = [];

  List<SearchModel> getPopularFoodList(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, String collectionName) {
    _popularFoodList.clear();
    for (var doc in snapshot.data!.docs) {
      if (doc['collection'] == collectionName) {
        _popularFoodList
            .add(SearchModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    }
    return _popularFoodList;
  }

  // get people are looking list
  final List<SearchModel> _peopleAreLookingList = [];

  List<SearchModel> getPeopleAreLookingList(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, String collectionName) {
    _peopleAreLookingList.clear();
    for (var doc in snapshot.data!.docs) {
      if (doc['collection'] == collectionName) {
        _peopleAreLookingList
            .add(SearchModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    }
    return _peopleAreLookingList;
  }
}
