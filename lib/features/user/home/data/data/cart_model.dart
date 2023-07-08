class CartModel {
  final String productId;
  final String productImage;
  final String productCategory;
  final String productName;
  final String productPrice;
  final String productQuantity;

  const CartModel(
      {required this.productId,
      required this.productImage,
      required this.productCategory,
      required this.productName,
      required this.productPrice,
      required this.productQuantity});

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
}
