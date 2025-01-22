import 'package:yummy/features/user/payment/domain/paypal_entity/order_entity.dart';

import '../../../../home/data/data/cart_model.dart';

enum OrderStatus {
  pending,
  confirmed,
  shipped,
  delivered,
  cancelled,
}

class OrderModel {
  final String orderId;
  final double totalPrice;
  final List<CartModel> cartItems;
  OrderStatus orderStatus;
  String orderDate;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    required this.cartItems,
    this.orderStatus = OrderStatus.pending,
    this.orderDate = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'cartItems': cartItems,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      totalPrice: json['totalPrice'],
      cartItems: json['cartItems']
          .map<CartModel>((v) => CartModel.fromJson(v))
          .toList(),
    );
  }

  static OrderEntity toEntity(OrderModel model) {
    return OrderEntity(
      orderId: model.orderId,
      totalPrice: model.totalPrice,
      cartItems: model.cartItems,
    );
  }
}
