import 'package:flutter/material.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';

import '../../../common/helper/images/image_display_helper.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/order/entities/product_ordered_entity.dart';

class ProductOrderedCardWidget extends StatelessWidget {
  final ProductOrderedEntity productOrderedEntity;

  const ProductOrderedCardWidget(
      {required this.productOrderedEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.secondBackgroundDark
              : AppColors.secondBackgroundLight,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                ImageDisplayHelper.generateProductImageURL(
                                    productOrderedEntity.productImage))),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productOrderedEntity.productTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Text.rich(
                          overflow: TextOverflow.ellipsis,
                          TextSpan(
                              text: 'Size - ',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                              children: [
                                TextSpan(
                                  text: productOrderedEntity.productSize,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )
                              ])),
                      const SizedBox(width: 10),
                      Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(
                            text: 'Color - ',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                            children: [
                              TextSpan(
                                text: productOrderedEntity.productColor,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              )
                            ]),
                      ),
                      const SizedBox(width: 10),
                      Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(
                            text: 'Quantity - ',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                            children: [
                              TextSpan(
                                text: productOrderedEntity.productQuantity.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              )
                            ]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            '\$${productOrderedEntity.totalPrice}',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          )
        ],
      ),
    );
  }
}
