import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yummy/core/utils/firestore_services.dart';
import 'package:yummy/core/utils/styles.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  final ImagePicker _picker = GetIt.I.get<ImagePicker>();
  final FirestoreServices _services = GetIt.I.get<FirestoreServices>();

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

  /// *****************************ingrediants images*******************************************
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

  final List<String> _downloadedUrls = [];

  List<String> get getDownloadedUrls {
    return _downloadedUrls;
  }

  // after we pick ingrediants images we should save them in fire storage
  // after execute this func we should have list of downloaded urls
  Future<void> uploadIngrediantsImages(List<File> ingImages) async {
    for (var img in ingImages) {
      final response = await _services.storeInFirebaseStorage(
          folder: 'ingrediants', imageFilePath: img);
      response.fold((fail) {
        print(fail.errorMessage);
      }, (url) {
        _downloadedUrls.add(url);
      });
    }
  }

  /// **************************food image*****************************
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

  late String _downloadedUrl;
  // another function to upload food image the same logic of uploading
  // ingrediants images
  Future<void> uploadFoodImage(File image) async {
    final response = await _services.storeInFirebaseStorage(
        folder: 'foods', imageFilePath: image);
    response.fold((fail) {
      print(fail.errorMessage);
    }, (url) {
      _downloadedUrl = url;
    });
  }

  /// ****************************save form to firestore*************************************
  Future<void> save(BuildContext context) async {
    if (_form.currentState!.validate()) {
      if (_ingrediantsImages.isNotEmpty) {
        if (_image != null) {
          emit(SaveLoading());
          try {
            GoRouter.of(context).pop();
            await uploadIngrediantsImages(_ingrediantsImages);
            await uploadFoodImage(_image!);
            String id = DateTime.now().microsecondsSinceEpoch.toString();
            await _services.storeInFirebaseStore(coll: 'food', map: {
              'category': _selectedCategory,
              'collection': _selectedCollection,
              'name': _foodNameController.text,
              'prepareTime': _prepareTimeController.text,
              'rate': _rateController.text,
              'price': _priceController.text,
              'desc': _descriptionController.text,
              'ingrediants': _downloadedUrls,
              'foodImage': _downloadedUrl,
              'id': id,
            });
            emit(SaveSuccess());
          } catch (error) {
            print(error);
            emit(SaveFailure());
          }
        } else {
          emit(HitSaveWithoutPickFoodImage());
        }
      } else {
        emit(HitSaveWithoutPickIngrediantImages());
      }
    }
  }

  /// ****************************reset form*************************************
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
