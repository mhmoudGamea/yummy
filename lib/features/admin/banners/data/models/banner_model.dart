import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String image;
  final String id;

  BannerModel({required this.image, required this.id});

  factory BannerModel.fromJson(QueryDocumentSnapshot<Object?> json) {
    return BannerModel(image: json['image'], id: json['id']);
  }
}
