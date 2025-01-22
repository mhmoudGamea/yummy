class CartModel {
  final String productId;
  final String productImage;
  final String productCategory;
  final String productName;
  final String productPrice;
  int productQuantity;

  CartModel({
    required this.productId,
    required this.productImage,
    required this.productCategory,
    required this.productName,
    required this.productPrice,
    this.productQuantity = 0,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        productId: json['productId'],
        productImage: json['productImage'],
        productCategory: json['productCategory'],
        productName: json['productName'],
        productPrice: json['productPrice'],
        productQuantity: json['productQuantity']);
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productImage': productImage,
      'productCategory': productCategory,
      'productName': productName,
      'productPrice': productPrice,
      'productQuantity': productQuantity,
    };
  }

  @override
  String toString() {
    return 'CartModel(productId: $productId, productImage: $productImage, productCategory: $productCategory, productName: $productName, productPrice: $productPrice, productQuantity: $productQuantity)';
  }
}
