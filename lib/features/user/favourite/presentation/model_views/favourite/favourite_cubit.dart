import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/favourite_model.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();
  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();

  Future<void> addToFavourite(
      {required FavouriteModel model, required bool isLiked}) async {
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
