class CategoryModel {
  final String image;
  final String categoryName;
  final String id;

  CategoryModel(
      {required this.image, required this.categoryName, required this.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        image: json['image'],
        categoryName: json['categoryName'],
        id: json['id']);
  }
}
