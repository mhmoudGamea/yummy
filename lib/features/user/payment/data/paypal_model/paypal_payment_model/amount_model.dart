import '../../../domain/paypal_entity/order_entity.dart';
import 'details_model.dart';

class AmountModel {
  String? total;
  String? currency;
  DetailsModel? detailsModel;

  AmountModel({this.total, this.currency, this.detailsModel});

  factory AmountModel.fromOrderEntity(OrderEntity orderEntity) => AmountModel(
        total: orderEntity.totalPrice.toString(),
        currency: 'USD',
        detailsModel: DetailsModel.fromOrderEntity(orderEntity),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': detailsModel?.toJson(),
      };

//   factory AmountModel.fromJson(Map<String, dynamic> json) => AmountModel(
//         total: json['total'] as String?,
//         currency: json['currency'] as String?,
//         detailsModel: json['details'] == null
//             ? null
//             : DetailsModel.fromJson(json['details'] as Map<String, dynamic>),
//       );

//   static AmountEntity toAmountEntity(AmountModel amountModel) {
//     return AmountEntity(
//       total: amountModel.total ?? '',
//       currency: amountModel.currency ?? '',
//       detailsEntity: DetailsModel.toDetailsEntity(amountModel.detailsModel!),
//     );
//   }
}
