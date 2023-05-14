part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class ImagePickedSuccessfully extends CategoryState {}

class ImagePickedDeleted extends CategoryState {}

// states of uploading image to firebase storage
class UploadImageLoading extends CategoryState {}

class UploadImageFailure extends CategoryState {}

class UploadImageSuccess extends CategoryState {}

class HitSaveWithoutPickImage extends CategoryState {}
