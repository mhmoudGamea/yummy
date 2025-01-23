import 'amount_entity.dart';
import 'item_list_entity.dart';

class PaypalPaymentEntity {
  AmountEntity? amountEntity;
  String? description;
  ItemListEntity? itemListEntity;

  PaypalPaymentEntity(
      {this.amountEntity, this.description, this.itemListEntity});
}
