import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();

  final List<String> _images = [];

  List<String> get getImages {
    return _images;
  }

  Future<void> getBanners() async {
    emit(BannerLoading());
    _store.collection('banners').snapshots().listen((event) {
      _images.clear();
      for (var element in event.docs) {
        _images.add(element['image']);
      }
      emit(BannerSuccess(banners: _images));
    }, onError: (error) {
      emit(BannerFailure(error: error));
    });
  }
}
