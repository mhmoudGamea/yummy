import '../../../domain/paypal_entity/order_entity.dart';

class DetailsModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsModel({this.subtotal, this.shipping, this.shippingDiscount});

  factory DetailsModel.fromOrderEntity(OrderEntity orderEntity) => DetailsModel(
        subtotal: orderEntity.totalPrice.toString(),
        shipping: '0',
        shippingDiscount: 0,
      );

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  // factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
  //       subtotal: json['subtotal'] as String?,
  //       shipping: json['shipping'] as String?,
  //       shippingDiscount: json['shipping_discount'] as int?,
  //     );

  // static DetailsEntity toDetailsEntity(DetailsModel detailsModel) {
  //   return DetailsEntity(
  //     subtotal: detailsModel.subtotal ?? '',
  //     shipping: detailsModel.shipping ?? '',
  //     shippingDiscount: detailsModel.shippingDiscount ?? 0,
  //   );
  // }
}
