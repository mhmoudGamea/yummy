import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/features/user/search/data/models/search_model.dart';
import 'package:yummy/features/user/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitial());

  final TextEditingController _searchController = TextEditingController();

  TextEditingController get getSearchController {
    return _searchController;
  }

  // i have 3 cases in my mind
  // 1- user first enter to search view so he find the default ui[he doesn't search about anything]
  // 2- user press search while controller is empty so we return a widget tell him to enter text to search about it first
  // 3- user enter a text and press on search icon [this text could be valid or invalid => 'chicken' or 'jdjnkdj']
  // so if it's valid i return listview with data else return errorWidget
  void searchItems(BuildContext context) async {
    emit(SearchLoading());
    if (getSearchController.text.isEmpty) {
      emit(SearchInitial());
      Helper.showCustomToast(
          context: context,
          bgColor: primaryColor,
          icon: FontAwesomeIcons.triangleExclamation,
          msg: 'Please, enter a value to search about it.');
    } else if (getSearchController.text.isNotEmpty) {
      final response = await _searchRepo.searchFood(getSearchController.text);
      response.fold((fail) {
        emit(SearchFailure(error: fail.errorMessage));
      }, (searchedList) {
        if (searchedList.isEmpty) {
          emit(SearchInitial());
          Helper.showCustomToast(
              context: context,
              bgColor: secondaryColor,
              icon: FontAwesomeIcons.triangleExclamation,
              msg:
                  'Can\'t find this food, try to retype it or may be you misspelling it.');
        } else {
          emit(SearchSuccess(searchList: searchedList));
        }
      });
    }
  }

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

  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();
  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();

  Future<void> addToFavourite(
      {required SearchModel model, required bool isLiked}) async {
    _store
        .collection('food')
        .where('id', isEqualTo: model.id)
        .get()
        .then((value) {
      // if user hit like button i will add his uid to favourites list in firestore
      if (isLiked) {
        _store.collection('food').doc(value.docs.first.id).update({
          'favourites': FieldValue.arrayUnion([_auth.currentUser!.uid]),
        });
      } else {
        _store.collection('food').doc(value.docs.first.id).update({
          'favourites': FieldValue.arrayRemove([_auth.currentUser!.uid]),
        });
      }
    });
  }
}
