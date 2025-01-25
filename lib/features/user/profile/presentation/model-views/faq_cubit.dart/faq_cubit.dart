import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/user/profile/data/faq_model.dart';

import '../../../../../../core/constants.dart';
import 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  static final _faqColl =
      GetIt.instance<FirebaseFirestore>().collection(kFaqCollection);

  Future<void> getFAQ() async {
    try {
      emit(FaqLoading());
      final result = await _faqColl.get();
      if (result.docs.isNotEmpty) {
        final faqs =
            result.docs.map((e) => FaqModel.fromJson(e.data()['faq'])).toList();
        emit(FaqSuccess(faqs: faqs));
      }
    } catch (error) {
      log(error.toString());
      emit(FaqFailure());
    }
  }

  void toggleExpanded(bool isExpanded, int index) {
    final faqs = (state as FaqSuccess).faqs;
    faqs[index].isExpanded = isExpanded;
    emit(FaqSuccess(faqs: faqs));
  }
}
