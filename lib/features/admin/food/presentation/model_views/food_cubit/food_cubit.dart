import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  final ImagePicker _picker = GetIt.I.get<ImagePicker>();

  final _form = GlobalKey<FormState>();
  GlobalKey get getFormKey {
    return _form;
  }

  final TextEditingController _categoryController = TextEditingController();
  TextEditingController get getCategoryController {
    return _categoryController;
  }

  final TextEditingController _foodNameController = TextEditingController();
  TextEditingController get getFoodNameController {
    return _foodNameController;
  }

  final TextEditingController _prepareTimeController = TextEditingController();
  TextEditingController get getPrepareController {
    return _prepareTimeController;
  }

  final TextEditingController _rateController = TextEditingController();
  TextEditingController get getRateController {
    return _rateController;
  }

  final TextEditingController _priceController = TextEditingController();
  TextEditingController get getPriceController {
    return _priceController;
  }

  File? _image;

  File? get getPickedImage {
    return _image;
  }

  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _image = File(_image!.path);
    emit(ImagePickedSuccessfully());
  }
}
