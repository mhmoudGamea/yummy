class CartModel {
  final String cartId;
  final String productId;
  final String productImage;
  final String productCategory;
  final String productName;
  final String productPrice;
  final int productQuantity;

  const CartModel(
      {required this.cartId,
      required this.productId,
      required this.productImage,
      required this.productCategory,
      required this.productName,
      required this.productPrice,
      required this.productQuantity});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        cartId: json['cartId'],
        productId: json['productId'],
        productImage: json['productImage'],
        productCategory: json['productCategory'],
        productName: json['productName'],
        productPrice: json['productPrice'],
        productQuantity: json['productQuantity']);
  }

  Map<String, dynamic> toJson() {
    return {
      'cartId': cartId,
      'productId': productId,
      'productImage': productImage,
      'productCategory': productCategory,
      'productName': productName,
      'productPrice': productPrice,
      'productQuantity': productQuantity,
    };
  }
}
