import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/firestore_services.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/features/admin/banners/data/repos/banner_repo.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final BannerRepo _bannerRepo;
  BannerCubit(this._bannerRepo) : super(BannerInitial());

  final ImagePicker _picker = GetIt.I.get<ImagePicker>();
  final FirestoreServices _services = GetIt.I.get<FirestoreServices>();

  // this function is used to pick banner image from phone banner
  File? _image;
  File? get getPickedImage {
    return _image;
  }

  Future<void> pickBanner() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _image = File(image!.path);
  }

  // if the admin hit delete button after pick his banner
  void deletePickedImage() async {
    _image = null;
    emit(PickedImageDeleted());
  }

  // after pick banner from phone this func will upload it to firestorage
  Future<void> uploadBanner(BuildContext context) async {
    emit(UploadImageLoading());
    final response = await _bannerRepo.uploadImage(
        folder: 'banners', imageFilePath: _image!);
    response.fold((fail) {
      emit(UploadImageFailure());
      Helper.showCustomToast(
          context: context,
          bgColor: mintGreen,
          icon: FontAwesomeIcons.check,
          msg: fail.errorMessage);
    }, (url) async {
      await saveBanner(context: context, url: url);
      emit(UploadImageSuccess());
    });
  }

  // this function is automatically called after finishing from uploading banner
  // to firebase storage to save it to firebase firestore

  Future<void> saveBanner(
      {required BuildContext context, required String url}) async {
    await _bannerRepo.storeBanner(coll: 'banners', map: {'image': url});
  }

  // function to delete banner
  void daleteBanner(BuildContext context, String id) async {
    await _services
        .deleteFromFirebaseStore(coll: 'banners', id: id)
        .then((value) {
      Helper.showCustomToast(
          context: context,
          bgColor: mintGreen,
          icon: FontAwesomeIcons.check,
          msg: value);
    });
  }
}
