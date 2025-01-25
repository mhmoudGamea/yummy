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
      addressModel: entity.addressEntity != null
          ? AddressModel.fromAddressEntity(entity.addressEntity!)
          : null,
      orderStatus: entity.orderStatus,
      orderDate: entity.orderDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'cartItems': cartItems.map((item) => item.toJson()).toList(),
      'addressModel': addressModel!.toJson(),
      'orderStatus': orderStatus.toString().split('.').last,
      'orderDate': orderDate,
    };
  }

  static OrderStatus getOrderStatusFromString(String value) {
    return OrderStatus.values
        .firstWhere((element) => element.toString().split('.').last == value);
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      totalPrice: json['totalPrice'],
      cartItems: json['cartItems']
          .map<CartModel>((v) => CartModel.fromJson(v))
          .toList(),
      addressModel: json['addressModel'] != null
          ? AddressModel.fromJson(json['addressModel'])
          : null,
      orderStatus: getOrderStatusFromString(json['orderStatus']),
      orderDate: json['orderDate'],
    );
  }

  static OrderEntity toOrderEntity(OrderModel orderModel) {
    return OrderEntity(
      orderId: orderModel.orderId,
      totalPrice: orderModel.totalPrice,
      cartItems: orderModel.cartItems,
      addressEntity: orderModel.addressModel != null
          ? AddressModel.toAddressEntity(orderModel.addressModel!)
          : null,
      orderStatus: orderModel.orderStatus,
      orderDate: orderModel.orderDate,
    );
  }
}
