import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/error/failure.dart';
import '../models/search_model.dart';
import './search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();
  List<SearchModel> search = [];
  @override
  Future<Either<Failure, List<SearchModel>>> searchFood(String value) async {
    //
    try {
      await _store.collection('food').get().then((values) {
        search = [];
        for (var doc in values.docs) {
          if (doc['name'].toLowerCase().contains(value.toLowerCase())) {
            search.add(SearchModel.fromJson(doc.data()));
          }
        }
      });
      return right(search);
    } catch (error) {
      return left(FireStoreSideError(error.toString()));
    }
  }
}

/*
_store.collection('food').get().then((values) {
        for(var doc in values.docs) {
          if(doc['name'].toLowerCase().contains(value.toLowerCase())) {
            
          }
        }
      });



      void getSearchUsersChats({String? name}) {
    emit(UsersSearchChatsLoading());

    if (name != null) {
      chatsCollectionRF
          .where('name', isGreaterThanOrEqualTo: name)
          .where('name', isLessThanOrEqualTo: '${name}z')
          .snapshots()
          .listen((event) {
        chats = [];
        for (var chat in event.docs) {
          if (chat.id != uId) {
            chats.add(UserModel.fromFireStore(chat));
          }
        }
        emit(UsersSearchChatsSuccess(chats: chats));
      }, onError: (error) {
        emit(UsersSearchChatsFailure(error: error));
      });
    } else {
      chatsCollectionRF.snapshots().listen((event) {
        chats = [];
        for (var chat in event.docs) {
          if (chat.id != uId) {
            chats.add(UserModel.fromFireStore(chat));
          }
        }
        emit(UsersSearchChatsSuccess(chats: chats));
      }, onError: (error) {
        emit(UsersSearchChatsFailure(error: error));
      });
    }
  }

*/
