import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/services/user_service.dart';
import 'package:yummy/core/utils/firestore_services.dart';
import 'package:yummy/features/user/profile/domain/repos/profile_repo.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo, this._userService) : super(ProfileInitial());

  final ProfileRepo _profileRepo;
  final UserService _userService;

  Future<int> getOrdersNumber() async {
    var orders = 0;
    emit(NumberOfOrdersLoading());
    final result = await _profileRepo.getOrdersNumber();
    result.fold(
        (error) => {emit(NumberOfOrdersFailure())},
        (numberOfOrders) =>
            {orders = numberOfOrders, emit(NumberOfOrdersSuccess())});
    return orders;
  }

  Future<double> getUserSpending() async {
    var spending = 0.0;
    emit(UserSpendingLoading());
    final result = await _profileRepo.getUserSpending();
    result.fold(
        (error) => {emit(UserSpendingFailure())},
        (totalSpending) =>
            {spending = totalSpending, emit(UserSpendingSuccess())});
    return spending;
  }

  final ImagePicker _picker = GetIt.I.get<ImagePicker>();
  final FirestoreServices _services = GetIt.I.get<FirestoreServices>();
  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();
  final String uid = GetIt.I.get<FirebaseAuth>().currentUser!.uid;

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
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _profileImage = File(image.path);
        emit(SuccessfulPickingProfileImage());
      }
    } catch (e) {
      emit(ErrorPickingProfileImage());
    }
  }

  // this function will upload the profile image of this user to storage
  // and get it's url
  Future<void> uploadProfileImage() async {
    emit(UploadProfileImageLoading());
    final response = await _services.storeInFirebaseStorage(
        folder: 'users', imageFilePath: getProfileImage!);
    response.fold((fail) {
      log('error in profilecubit: saveProfileImage: ${fail.errorMessage}');
      emit(UploadProfileImageFailure());
    }, (url) async {
      await saveProfileImage(url: url);
      emit(UploadProfileImageSuccess());
    });
  }

  // this function just will update the field [profile image] in this signed in user
  Future<void> saveProfileImage({required String url}) async {
    try {
      emit(SaveProfileImageLoading());
      await _store
          .collection(kUsersCollection)
          .doc(uid)
          .update({'profileImage': url});
      emit(SaveProfileImageSuccess());
    } catch (error) {
      log('error in profilecubit: saveProfileImage: $error');
      await _services.deleteImageFromFirebaseStorage(folder: kUsersCollection);
      emit(SaveProfileImageFailure());
    }
  }

  // this function will get the user data from firebase firestore
  UserModel? _userModel;
  UserModel? get getUserModel {
    return _userModel;
  }

  Future<void> getUserProfileData() async {
    try {
      emit(GetUserInfoLoading());
      final result = await _userService.getUserProfileData();
      _userModel = UserModel.fromJson(result);
      emit(GetUserInfoSuccess());
      populating();
    } on FireStoreSideError catch (error) {
      log(error.errorMessage);
      emit(GetUserInfoFailure());
    }
  }

  // a function to populate text editing controller when user want to edit his information
  void populating() {
    getNameController.text = _userModel!.name ?? '';
    getEmailController.text = _userModel!.email ?? '';
    getPhoneController.text = _userModel!.phoneNumber;
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
        await _store.collection('users').doc(uid).update({
          'name': getNameController.text,
          'email': getEmailController.text,
          'phoneNumber': getPhoneController.text
        });
        emit(ConfirmEditingWithImageSuccess());
      } else {
        await _store.collection('users').doc(uid).update({
          'name': getNameController.text,
          'email': getEmailController.text,
          'phoneNumber': getPhoneController.text
        });
        emit(ConfirmEditingWithoutImageSuccess());
      }
    } catch (error) {
      emit(ConfirmEditingFailure());
    }
  }

  // a function that will get the new updated userInfoModel directly from firebase after updating
  UserModel getNewUpdatedData(QuerySnapshot<Object?>? snapshot) {
    for (var element in snapshot!.docs) {
      if (element.id == uid) {
        _userModel = UserModel.fromJson(element.data() as Map<String, dynamic>);
      }
    }
    return _userModel!;
  }
}
