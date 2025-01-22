import 'package:yummy/features/user/home/data/data/cart_model.dart';

class OrderEntity {
  final String orderId;
  final double totalPrice;
  final List<CartModel> cartItems;

  OrderEntity({
    required this.orderId,
    required this.totalPrice,
    required this.cartItems,
  });
}
