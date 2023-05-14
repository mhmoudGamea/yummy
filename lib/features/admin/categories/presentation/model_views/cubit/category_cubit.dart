import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:image_picker/image_picker.dart';
import 'package:yummy/core/utils/firestore_services.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final ImagePicker _picker = GetIt.I.get<ImagePicker>();
  final FirestoreServices _services = GetIt.I.get<FirestoreServices>();

  File? _image;
  File? get getPickedImage {
    return _image;
  }

  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _image = File(image!.path);
    emit(ImagePickedSuccessfully());
  }

  void deletePickedImage() async {
    _image = null;
    emit(ImagePickedDeleted());
  }

  final TextEditingController _categoryController = TextEditingController();
  TextEditingController get getCategoryController {
    return _categoryController;
  }

  final _form = GlobalKey<FormState>();

  GlobalKey get getFormKey {
    return _form;
  }

  // this function 'll take the image of the category and save it in firebase storage
  Future<void> uploadCategoryImage(BuildContext context) async {
    if (_image != null) {
      if (_form.currentState!.validate()) {
        emit(UploadImageLoading());
        GoRouter.of(context).pop();
        final response = await _services.storeInFirebaseStorage(
            folder: 'categories', imageFilePath: _image!);
        response.fold((fail) {
          emit(UploadImageFailure());
        }, (url) async {
          emit(UploadImageSuccess());
          await saveCategory(url: url);
        });
      }
    } else {
      emit(HitSaveWithoutPickImage());
    }
  }

  Future<void> saveCategory({required String url}) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    await _services.storeInFirebaseStore(coll: 'categories', map: {
      'image': url,
      'categoryName': _categoryController.text,
      'id': id
    });
    _categoryController.text = '';
    _image = null;
  }
}
