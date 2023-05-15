import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yummy/core/utils/styles.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  final ImagePicker _picker = GetIt.I.get<ImagePicker>();

  final _form = GlobalKey<FormState>();
  GlobalKey get getFormKey {
    return _form;
  }

  // category DropDownButton logic
  final List<String> _categoriesList = [
    'Fast Food',
    'Snack',
    'Drink',
    'Desert',
    'Soup',
    'Salad',
    'Sauce',
    'Pizza',
    'Pasta'
  ];

  var _selectedCategory = 'Fast Food';

  String get getSelectedCategory {
    return _selectedCategory;
  }

  set setSelectedCategory(String newCategory) {
    _selectedCategory = newCategory;
    emit(SelectedCategoryChanged());
  }

  // this function 'll conver the list of strings above to DropdownMenuItem
  List<DropdownMenuItem> convertCategory() {
    return _categoriesList
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: Styles.title14,
              ),
            ))
        .toList();
  }

  // collection DropDownButton logic
  final List<String> _collectionsList = [
    'Top Rated',
    'Near By you',
    'People are looking',
    'Kids',
  ];

  var _selectedCollection = 'Near By you';

  String get getSelectedCollection {
    return _selectedCollection;
  }

  set setSelectedCollection(String newCollection) {
    _selectedCollection = newCollection;
    emit(SelectedCollectionChanged());
  }

  // this function 'll conver the list of strings above to DropdownMenuItem
  List<DropdownMenuItem> convertCollection() {
    return _collectionsList
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: Styles.title14,
              ),
            ))
        .toList();
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

  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get getDescriptionController {
    return _descriptionController;
  }
  // start logic of picking the multiple images for the food plate ingrediants

  final List<File> _ingrediantsImages = [];

  List<File> get getIngrediantsImages {
    return _ingrediantsImages;
  }

  void pickIngrediantsImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      for (var element in images) {
        _ingrediantsImages.add(File(element.path));
      }
      emit(IngrediantsImagesSelected());
    }
  }

  // start logic of picking the only one image for the food plate
  File? _image;

  File? get getPickedImage {
    return _image;
  }

  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _image = File(image!.path);
    emit(ImagePickedSuccessfully());
  }

  // start delete button logic
  void delete() {
    _selectedCategory = _categoriesList.first;
    _selectedCollection = _collectionsList.first;
    _foodNameController.text = '';
    _prepareTimeController.text = '';
    _rateController.text = '';
    _priceController.text = '';
    _descriptionController.text = '';
    _ingrediantsImages.length = 0;
    _image = null;
  }
}
