import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yummy/core/utils/firestore_services.dart';
import 'package:yummy/core/utils/helper.dart';

import '../../../../../../core/config/app_colors.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

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

  Future<void> uploadBanner(BuildContext context) async {
    emit(UploadImageLoading());
    if (_image != null) {
      final response = await _services.storeInFirebaseStorage(
          folder: 'banners', imageFilePath: _image!);
      response.fold((fail) {
        emit(UploadImageFailure());
      }, (url) async {
        emit(UploadImageSuccess());
        await saveBanner(url: url);
      });
    } else {
      // what would happen when user try to hit save without pick an image
      GoRouter.of(context).pop();
      Helper.showCustomToast(
          context: context,
          bgColor: AppColors.secondaryColor,
          icon: FontAwesomeIcons.xmark,
          msg: 'Please pick an image First.');
    }
  }

  Future<void> saveBanner({required String url}) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    await _services
        .storeInFirebaseStore(coll: 'banners', map: {'image': url, 'id': id});
  }

  // function to delete banner
  void daleteBanner(BuildContext context, String id) async {
    await _services.deleteFromFirebaseStore(coll: 'banners', id: id);
  }
}
