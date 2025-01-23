import '../../../../home/data/data/cart_model.dart';

class ItemModel {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemModel({this.name, this.quantity, this.price, this.currency});

  factory ItemModel.fromCartModel(CartModel cartModel) => ItemModel(
        name: cartModel.productName,
        quantity: cartModel.productQuantity,
        price: cartModel.productPrice,
        currency: 'USD',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };

  // factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
  //       name: json['name'] as String?,
  //       quantity: json['quantity'] as int?,
  //       price: json['price'] as String?,
  //       currency: json['currency'] as String?,
  //     );

  // static ItemEntity toItemEntity(ItemModel itemModel) {
  //   return ItemEntity(
  //     name: itemModel.name,
  //     quantity: itemModel.quantity,
  //     price: itemModel.price,
  //     currency: itemModel.currency,
  //   );
  // }
}
