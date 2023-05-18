class AdminFoodModel {
  final String calories;
  final String category;
  final String collection;
  final String desc;
  final String foodImage;
  final String id;
  final List<dynamic> ingrediants;
  final String name;
  final String prepareTime;
  final String price;
  final String rate;

  AdminFoodModel(
      {required this.calories,
      required this.category,
      required this.collection,
      required this.desc,
      required this.foodImage,
      required this.id,
      required this.ingrediants,
      required this.name,
      required this.prepareTime,
      required this.price,
      required this.rate});

  factory AdminFoodModel.fromJson(Map<String, dynamic> json) {
    return AdminFoodModel(
        calories: json['calories'],
        category: json['category'],
        collection: json['collection'],
        desc: json['desc'],
        foodImage: json['foodImage'],
        id: json['id'],
        ingrediants: json['ingrediants'],
        name: json['name'],
        prepareTime: json['prepareTime'],
        price: json['price'],
        rate: json['rate']);
  }

  Map<String, dynamic> toMap() {
    return {
      'calories': calories,
      'category': category,
      'collection': collection,
      'desc': desc,
      'foodImage': foodImage,
      'id': id,
      'ingrediants': ingrediants,
      'name': name,
      'prepareTime': prepareTime,
      'price': price,
      'rate': rate,
    };
  }
}
