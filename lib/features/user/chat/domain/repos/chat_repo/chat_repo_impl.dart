import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/core/models/user_model.dart';
import 'package:yummy/features/user/chat/data/models/message_model.dart';

import '../../../../../../core/constants.dart';
import 'chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  static final _uid = GetIt.instance<FirebaseAuth>().currentUser!.uid;
  final _store =
      GetIt.instance<FirebaseFirestore>().collection(kUsersCollection);

  @override
  Future<Either<Failure, List<UserModel>>> getContacts() async {
    try {
      final result = await GetIt.instance<FirebaseFirestore>()
          .collection(kUsersCollection)
          .get();

      return right(
          result.docs.map((e) => UserModel.fromJson(e.data())).toList());
    } catch (error) {
      log('same error');
      log(error.toString());
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(
      {required String message, required String receiverUid}) async {
    final msg = MessageModel(
        message: message,
        sender: _uid,
        receiver: receiverUid,
        date: DateTime.now().toString());
    try {
      await _store
          .doc(_uid)
          .collection(kChatsCollection)
          .doc(receiverUid)
          .collection(kMessagesCollection)
          .add(msg.toMap());
      await _store
          .doc(receiverUid)
          .collection(kChatsCollection)
          .doc(_uid)
          .collection(kMessagesCollection)
          .add(msg.toMap());
      return right(null);
    } catch (error) {
      return left(ServerSideError(error.toString()));
    }
  }
}
