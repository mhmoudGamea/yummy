class FavouriteModel {
  final String category;
  final String name;
  final String rate;
  final String foodImage;

  FavouriteModel(
      {required this.category,
      required this.name,
      required this.rate,
      required this.foodImage});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
        category: json['category'],
        name: json['name'],
        rate: json['rate'],
        foodImage: json['foodImage']);
  }
  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'name': name,
      'rate': rate,
      'foodImage': foodImage,
    };
  }
}
