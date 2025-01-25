import 'package:yummy/features/user/profile/data/faq_model.dart';

abstract class FaqState {}

class FaqInitial extends FaqState {}

class FaqLoading extends FaqState {}

class FaqSuccess extends FaqState {
  final List<FaqModel> faqs;

  FaqSuccess({required this.faqs});
}

class FaqFailure extends FaqState {}
