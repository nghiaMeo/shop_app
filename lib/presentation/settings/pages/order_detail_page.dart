import 'package:flutter/material.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';
import 'package:shop_app/common/widgets/appbar/app_bar_widget.dart';
import 'package:shop_app/core/configs/theme/app_colors.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../domain/order/entities/order_entity.dart';
import 'order_items_page.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderDetailPage({required this.orderEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppbar(
          title: Text('Order #${orderEntity.code}'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatus(),
              const SizedBox(height: 50),
              _buildItems(context),
              const SizedBox(height: 30),
              _buildShipping(context)
            ],
          ),
        ));
  }

  Widget _buildStatus() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: orderEntity.orderStatus[index].done
                            ? AppColors.primary
                            : Colors.white,
                        shape: BoxShape.circle),
                    child: orderEntity.orderStatus[index].done
                        ? Icon(Icons.check)
                        : Container(),
                  ),
                  SizedBox(width: 15),
                  Text(
                    orderEntity.orderStatus[index].title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: orderEntity.orderStatus[index].done
                            ? Colors.white
                            : Colors.grey),
                  )
                ],
              ),
              Text(
                orderEntity.orderStatus[index].createdDate
                    .toDate()
                    .toString()
                    .split(' ')[0],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: orderEntity.orderStatus[index].done
                        ? Colors.white
                        : Colors.grey),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 50),
        reverse: true,
        itemCount: orderEntity.orderStatus.length);
  }

  Widget _buildItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Items',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            AppNavigator.push(
                context, OrderItemsPage(products: orderEntity.products));
          },
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? AppColors.secondBackgroundDark
                    : AppColors.secondBackgroundLight,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.receipt_rounded),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${orderEntity.products.length} Items',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  ],
                ),
                const Text(
                  'View All',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.primary),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildShipping(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 15),
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? AppColors.secondBackgroundDark
                    : AppColors.secondBackgroundLight,
                borderRadius: BorderRadius.circular(10)),
            child: Text(orderEntity.shippingAddress))
      ],
    );
  }
}
