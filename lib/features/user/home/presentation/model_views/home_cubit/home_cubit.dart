import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../data/data/user_food_model.dart';
import '../../../data/data/user_info_model.dart';
import '../../../data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();
  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();

  late UserInfoModel _userInfoModel;

  UserInfoModel get getUserInfoModel {
    return _userInfoModel;
  }

  Future<void> getUserData(BuildContext context) async {
    emit(UserInfoLoading());
    final response = await _homeRepo.getUserInformation();
    response.fold((failure) {
      emit(UserInfoFailure());
      Helper.showCustomToast(
          context: context,
          bgColor: secondaryColor,
          icon: Icons.close_rounded,
          msg: failure.errorMessage);
    }, (userInfoModel) {
      _userInfoModel = userInfoModel;
      emit(UserInfoSuccess(
          administrativeArea: userInfoModel.administrativeArea));
    });
  }

  Future<void> addToFavourite(
      {required UserFoodModel model, required bool isLiked}) async {
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
