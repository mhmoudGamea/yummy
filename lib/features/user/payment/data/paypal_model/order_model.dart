import 'package:yummy/features/user/payment/domain/paypal_entity/order_entity.dart';

import '../../../home/data/data/cart_model.dart';
import 'address_model.dart';

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
  AddressModel? addressModel;
  OrderStatus orderStatus;
  String orderDate;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    required this.cartItems,
    this.addressModel,
    this.orderStatus = OrderStatus.pending,
    this.orderDate = '',
  });

  factory OrderModel.fromOrderEntity(OrderEntity entity) {
    return OrderModel(
      orderId: entity.orderId,
      totalPrice: entity.totalPrice,
      cartItems: entity.cartItems,
      addressModel: AddressModel.fromAddressEntity(entity.addressEntity),
      orderStatus: entity.orderStatus,
      orderDate: entity.orderDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'cartItems': cartItems,
      'addressModel': addressModel,
      'orderStatus': orderStatus,
      'orderDate': orderDate,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      totalPrice: json['totalPrice'],
      cartItems: json['cartItems']
          .map<CartModel>((v) => CartModel.fromJson(v))
          .toList(),
      addressModel: AddressModel.fromJson(json['addressModel']),
      orderStatus: json['orderStatus'],
      orderDate: json['orderDate'],
    );
  }

  static OrderEntity toOrderEntity(OrderModel orderModel) {
    return OrderEntity(
      orderId: orderModel.orderId,
      totalPrice: orderModel.totalPrice,
      cartItems: orderModel.cartItems,
      addressEntity: AddressModel.toAddressEntity(orderModel.addressModel),
      orderStatus: orderModel.orderStatus,
      orderDate: orderModel.orderDate,
    );
  }
}
