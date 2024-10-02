import 'package:flutter/material.dart';
import 'package:shop_app/presentation/cart/widgets/product_ordered_card_widget.dart';

import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../domain/order/entities/product_ordered_entity.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;

  const OrderItemsPage({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(
          title: Text('Order Items'),
        ),
        body: _buildProducts());
  }

  Widget _buildProducts() {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return ProductOrderedCardWidget(
            productOrderedEntity: products[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: products.length);
  }
}
