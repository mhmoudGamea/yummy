import '../../../domain/paypal_entity/order_entity.dart';
import 'item_model.dart';

class ItemListModel {
  List<ItemModel>? items;

  ItemListModel({this.items});

  factory ItemListModel.fromOrderEntity(OrderEntity orederEntity) {
    return ItemListModel(
      items: orederEntity.cartItems
          .map((e) => ItemModel.fromCartModel(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };

  // factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
  //       items: (json['items'] as List<dynamic>?)
  //           ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
  //           .toList(),
  //     );

  // static ItemListEntity toItemListEntity(ItemListModel itemListModel) {
  //   return ItemListEntity(
  //     itemsEntity:
  //         itemListModel.items?.map((e) => ItemModel.toItemEntity(e)).toList(),
  //   );
  // }
}
