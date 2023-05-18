class FavouriteModel {
  final String category;
  final String name;
  final String rate;
  final String foodImage;
  final String id;
  final List<String> favourites;

  FavouriteModel({
    required this.category,
    required this.name,
    required this.rate,
    required this.foodImage,
    required this.favourites,
    required this.id,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
        category: json['category'],
        name: json['name'],
        rate: json['rate'],
        foodImage: json['foodImage'],
        id: json['id'],
        favourites: List.from(json['favourites']));
  }
  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'name': name,
      'rate': rate,
      'foodImage': foodImage,
      'id': id,
      'favourites': favourites,
    };
  }
}
