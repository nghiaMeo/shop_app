import 'package:flutter/material.dart';

import '../../../common/helper/images/image_display_helper.dart';
import '../../../domain/product/entities/product_entity.dart';

class ProductImagesWidget extends StatelessWidget {
  final ProductEntity productEntity;

  ProductImagesWidget({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    ImageDisplayHelper.generateProductImageURL(
                        productEntity.images[index]),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: productEntity.images.length),
    );
  }
}
