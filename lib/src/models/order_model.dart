import 'package:appquitanda_flutter/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createDateTime;
  DateTime overduDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createDateTime,
    required this.overduDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}
