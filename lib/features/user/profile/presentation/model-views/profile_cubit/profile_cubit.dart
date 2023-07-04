import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yummy/core/utils/firestore_services.dart';

import '../../../../home/data/data/user_info_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ImagePicker _picker = GetIt.I.get<ImagePicker>();
  final FirestoreServices _services = GetIt.I.get<FirestoreServices>();
  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();
  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get getNameController {
    return _nameController;
  }

  // this function will get the data of the user and store them in

  File? _profileImage;
  File? get getProfileImage {
    return _profileImage;
  }

  Future<void> pickProfileImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _profileImage = File(image!.path);
    emit(PickProfileImage());
  }

  // this function will upload the profile image of this user to storage
  Future<void> uploadProfileImage() async {
    emit(UploadProfileImageLoading());
    final response = await _services.storeInFirebaseStorage(
        folder: 'users', imageFilePath: getProfileImage!);
    response.fold((fail) {
      emit(UploadProfileImageFailure());
    }, (url) async {
      await saveProfileImage(url: url);
      emit(UploadProfileImageSuccess());
    });
  }

  // this function just will update the field [profile image] in this signed in user
  Future<void> saveProfileImage({required String url}) async {
    await _store
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .update({'profileImage': url});
  }

  // this function will get the user data from firebase firestore
  UserInfoModel? _userInfoModel;
  UserInfoModel? get getUserInfoModel {
    return _userInfoModel;
  }

  Future<void> getUserProfileData() async {
    emit(GetUserInfoLoading());
    final result =
        await _store.collection('users').doc(_auth.currentUser!.uid).get();
    if (result.data() == null) {
      print('Can\'t find user data');
      emit(GetUserInfoFailure());
    } else {
      _userInfoModel = UserInfoModel.fromJson(result.data()!);
      emit(GetUserInfoSuccess());
    }
  }

  Future<void> editingUserProfileData() async {}
}
