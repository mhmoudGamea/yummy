import 'package:yummy/features/user/home/data/data/cart_model.dart';

import '../../data/paypal_model/order_model.dart';
import 'address_entity.dart';

class OrderEntity {
  final String orderId;
  final double totalPrice;
  final List<CartModel> cartItems;
  AddressEntity? addressEntity;
  OrderStatus orderStatus;
  String orderDate;

  OrderEntity({
    required this.orderId,
    required this.totalPrice,
    required this.cartItems,
    this.addressEntity,
    this.orderStatus = OrderStatus.pending,
    this.orderDate = '',
  });

  @override
  String toString() {
    return 'OrderEntity(orderId: $orderId, totalPrice: $totalPrice, cartItems: $cartItems, addressEntity: ${addressEntity.toString()}, orderStatus: $orderStatus, orderDate: $orderDate)';
  }
}
