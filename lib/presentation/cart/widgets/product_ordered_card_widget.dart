import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';
import 'package:shop_app/domain/product/entities/product_entity.dart';

import '../../../common/helper/images/image_display_helper.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/order/entities/product_ordered_entity.dart';
import '../../product_detail/pages/product_detail_page.dart';
import '../bloc/cart_products_display_cubit.dart';

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
        borderRadius: BorderRadius.circular(8),
      ),
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
                              productOrderedEntity.productImage),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // AppNavigator.push(
                          //     context,
                          //     ProductDetailPage(
                          //       productEntity: productEntity,
                          //     ));
                        },
                        child: Text(
                          productOrderedEntity.productTitle,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(
                          text: 'Size - ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                          children: [
                            TextSpan(
                              text: productOrderedEntity.productSize,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
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
                      SizedBox(width: 10),
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
                                text: productOrderedEntity.productQuantity
                                    .toString(),
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${productOrderedEntity.totalPrice}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<CartProductsDisplayCubit>()
                        .removeProduct(productOrderedEntity);
                  },
                  child: Container(
                    height: 23,
                    width: 23,
                    decoration: const BoxDecoration(
                        color: Color(0xffFF8383), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.remove,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
