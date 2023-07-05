import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/firestore_services.dart';

import '../../../../home/data/data/user_info_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ImagePicker _picker = GetIt.I.get<ImagePicker>();
  final FirestoreServices _services = GetIt.I.get<FirestoreServices>();
  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get getNameController {
    return _nameController;
  }

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get getEmailController {
    return _emailController;
  }

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get getPhoneController {
    return _phoneController;
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
    await _store.collection('users').doc(uid).update({'profileImage': url});
  }

  // this function will get the user data from firebase firestore
  UserInfoModel? _userInfoModel;
  UserInfoModel? get getUserInfoModel {
    return _userInfoModel;
  }

  Future<void> getUserProfileData() async {
    emit(GetUserInfoLoading());
    final result = await _store.collection('users').doc(uid).get();
    if (result.data() == null) {
      print('Can\'t find user data');
      emit(GetUserInfoFailure());
    } else {
      _userInfoModel = UserInfoModel.fromJson(result.data()!);
      emit(GetUserInfoSuccess());
      populating();
    }
  }

  // a function to populate text editing controller when user want to edit his information
  void populating() {
    getNameController.text = _userInfoModel!.name ?? '';
    getEmailController.text = _userInfoModel!.email ?? '';
    getPhoneController.text = _userInfoModel!.phoneNumber;
  }

  // this function is used to edit user info by 2 ways
  // 1- by update his profile image + [name, email, phone]
  // 2- by update [name, email, phone]
  Future<void> confirmEditingUserProfileData() async {
    try {
      emit(ConfirmEditingLoading());
      if (getProfileImage != null) {
        // then he choose a photo [first way]
        await uploadProfileImage();
        await _store.collection('users').doc(uid).update(
            {'name': getNameController.text, 'email': getEmailController.text});
        emit(ConfirmEditingWithImageSuccess());
      } else {
        await _store.collection('users').doc(uid).update(
            {'name': getNameController.text, 'email': getEmailController.text});
        emit(ConfirmEditingWithoutImageSuccess());
      }
    } catch (error) {
      emit(ConfirmEditingFailure());
    }
  }

  // a function that will get the new updated userInfoModel directly from firebase after updating
  UserInfoModel getNewUpdatedData(QuerySnapshot<Object?>? snapshot) {
    snapshot!.docs.forEach((element) {
      if (element.id == uid) {
        _userInfoModel =
            UserInfoModel.fromJson(element.data() as Map<String, dynamic>);
      }
    });
    return _userInfoModel!;
  }
}
