import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String image;
  final String id;

  BannerModel({required this.image, required this.id});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(image: json['image'], id: json['id']);
  }
}
