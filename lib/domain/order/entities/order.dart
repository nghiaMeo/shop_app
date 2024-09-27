import 'package:shop_app/domain/order/entities/product_ordered.dart';

import 'order_status.dart';

class OrderEntity {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity(
      {required this.products,
      required this.createdDate,
      required this.shippingAddress,
      required this.itemCount,
      required this.totalPrice,
      required this.code,
      required this.orderStatus});
}
