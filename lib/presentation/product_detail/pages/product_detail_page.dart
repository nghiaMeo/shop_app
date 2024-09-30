
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../domain/product/entities/product_entity.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({
    required this.productEntity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => ProductQuantityCubit()),
        // BlocProvider(create: (context) => ProductColorSelectionCubit()),
        // BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        // BlocProvider(create: (context) => ButtonStateCubit()),
        // BlocProvider(create: (context) => FavoriteIconCubit()..isFavorite(productEntity.productId))
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          // action: FavoriteButton(
          //   productEntity: productEntity,
          // ),
        ),
        // bottomNavigationBar: AddToBag(productEntity: productEntity,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ProductImages(productEntity: productEntity, ),
              // const SizedBox(height: 10, ),
              // ProductTitle(productEntity: productEntity, ),
              // const SizedBox(height: 10, ),
              // ProductPrice(productEntity: productEntity, ),
              // const SizedBox(height: 20, ),
              // SelectedSize(productEntity: productEntity, ),
              // const SizedBox(height: 15, ),
              // SelectedColor(productEntity: productEntity, ),
              // const SizedBox(height: 15, ),
              // ProductQuantity(productEntity: productEntity, ),
            ],
          ),
        ),
      ),
    );
  }
}