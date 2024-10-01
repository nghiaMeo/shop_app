import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/product_detail/widget/favorite_button_widget.dart';

import '../../../common/bloc/button/button_state_cubit.dart';
import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../domain/product/entities/product_entity.dart';
import '../bloc/favorite_icon_cubit.dart';
import '../bloc/product_color_selection_cubit.dart';
import '../bloc/product_quantity_cubit.dart';
import '../bloc/product_size_selection_cubit.dart';
import '../widget/add_bag_widget.dart';
import '../widget/product_images_widget.dart';
import '../widget/product_price_widget.dart';
import '../widget/product_quantity_widget.dart';
import '../widget/product_title_widget.dart';
import '../widget/selected_color_widget.dart';
import '../widget/selected_size_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductDetailPage({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),
        BlocProvider(create: (context) => ProductColorSelectionCubit()),
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(
            create: (context) =>
                FavoriteIconCubit()..isFavorite(productEntity.productId))
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          action: FavoriteButtonWidget(
            productEntity: productEntity,
          ),
        ),
        bottomNavigationBar: AddBagWidget(
          productEntity: productEntity,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImagesWidget(
                productEntity: productEntity,
              ),
              const SizedBox(height: 10),
              ProductTitleWidget(
                productEntity: productEntity,
              ),
              const SizedBox(height: 10),
              ProductPriceWidget(
                productEntity: productEntity,
              ),
              const SizedBox(height: 20),
              SelectedSizeWidget(
                productEntity: productEntity,
              ),
              const SizedBox(height: 15),
              SelectedColorWidget(
                productEntity: productEntity,
              ),
              const SizedBox(height: 15),
              ProductQuantityWidget(
                productEntity: productEntity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
