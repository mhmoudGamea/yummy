part of 'food_cubit.dart';

@immutable
abstract class FoodState {}

class FoodInitial extends FoodState {}

class SelectedCategoryChanged extends FoodState {}

class SelectedCollectionChanged extends FoodState {}

class IngrediantsImagesSelected extends FoodState {}

class ImagePickedSuccessfully extends FoodState {}

class ImagePickedDeleted extends FoodState {}

class HitSaveWithoutPickIngrediantImages extends FoodState {}

class HitSaveWithoutPickFoodImage extends FoodState {}

class SaveLoading extends FoodState {}

class SaveSuccess extends FoodState {}

class SaveFailure extends FoodState {}
