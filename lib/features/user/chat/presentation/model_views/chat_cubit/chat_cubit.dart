import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/models/user_model.dart';

import '../../../../../../core/constants.dart';
import '../../../data/models/message_model.dart';
import '../../../domain/repos/chat_repo/chat_repo.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatRepo) : super(ChatInitial());
  final ChatRepo _chatRepo;

  static final _uid = GetIt.instance<FirebaseAuth>().currentUser!.uid;
  final _store =
      GetIt.instance<FirebaseFirestore>().collection(kUsersCollection);

  //method to get all users data for chat contacts

  final List<UserModel> _contactsList = [];

  List<UserModel> get contactsList => _contactsList;
  void getContacts() async {
    try {
      emit(GetContactsLoading());
      final result = await _chatRepo.getContacts();
      result.fold((fail) {
        emit(GetContactsError());
      }, (success) {
        _contactsList.clear();
        _contactsList.addAll(success);
        emit(GetContactsSuccess());
      });
    } catch (error) {
      emit(GetContactsError());
    }
  }

  // method to get current user uid

  String get uId => _uid;

  final TextEditingController _messageController = TextEditingController();

  TextEditingController get messageController => _messageController;

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  void sendMessage(String receiverUid) async {
    try {
      if (_messageController.text.isNotEmpty) {
        emit(ChatSendingLoading());
        final result = await _chatRepo.sendMessage(
            message: _messageController.text, receiverUid: receiverUid);
        _messageController.clear();
        result.fold((fail) {
          emit(ChatSendingError());
        }, (success) {
          emit(ChatSendingSuccess());
          _scrollController.animateTo(0,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn);
        });
      }
    } catch (error) {
      emit(ChatSendingError());
    }
  }

  final List<MessageModel> _messageList = [];

  List<MessageModel> get messageList => _messageList;

  Future<void> getMessages({required String receiverUid}) async {
    try {
      emit(GetChatLoading());
      _store
          .doc(_uid)
          .collection(kChatsCollection)
          .doc(receiverUid)
          .collection(kMessagesCollection)
          .orderBy('date', descending: true)
          .snapshots()
          .listen((value) {
        _messageList.clear();
        for (var element in value.docs) {
          _messageList.add(MessageModel.fromJson(element.data()));
        }
        log(_messageList.length.toString());
        emit(GetChatSuccess());
      });
    } catch (error) {
      emit(GetChatError());
    }
  }
}
