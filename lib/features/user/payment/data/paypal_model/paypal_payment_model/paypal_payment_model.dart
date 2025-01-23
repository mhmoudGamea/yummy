import '../../../domain/paypal_entity/order_entity.dart';
import 'amount_model.dart';
import 'item_list_model.dart';

class PaypalPaymentModel {
  AmountModel? amount;
  String? description;
  ItemListModel? itemList;

  PaypalPaymentModel({this.amount, this.description, this.itemList});

  factory PaypalPaymentModel.fromOrderEntity(OrderEntity orderEntity) {
    return PaypalPaymentModel(
      amount: AmountModel.fromOrderEntity(orderEntity),
      description: 'Payment for order ${orderEntity.orderId}',
      itemList: ItemListModel.fromOrderEntity(orderEntity),
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };

  // factory PaypalPaymentModel.fromJson(Map<String, dynamic> json) {
  //   return PaypalPaymentModel(
  //     amount: json['amount'] == null
  //         ? null
  //         : AmountModel.fromJson(json['amount'] as Map<String, dynamic>),
  //     description: json['description'] as String?,
  //     itemList: json['item_list'] == null
  //         ? null
  //         : ItemListModel.fromJson(json['item_list'] as Map<String, dynamic>),
  //   );
  // }
}
