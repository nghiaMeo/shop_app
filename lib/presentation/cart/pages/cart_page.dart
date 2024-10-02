import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/presentation/cart/widgets/check_out_widget.dart';
import 'package:shop_app/presentation/cart/widgets/product_ordered_card_widget.dart';

import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../domain/order/entities/product_ordered_entity.dart';
import '../bloc/cart_products_display_cubit.dart';
import '../bloc/cart_products_display_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
            'Cart'
        ),
      ),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit,CartProductsDisplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading){
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty ? Center(child: _buildCartIsEmpty()) : Stack(
                children: [
                  _buildProducts(state.products),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CheckOutWidget(products: state.products,)
                  )
                ],
              );
            }
            if (state is LoadCartProductsFailure) {
              return Center(
                child: Text(
                    state.errorMessage
                ),
              );
            }
            return Container();
          },
        ) ,
      ),
    );
  }

  Widget _buildProducts(List<ProductOrderedEntity> products) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return ProductOrderedCardWidget(
            productOrderedEntity: products[index]
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10,),
        itemCount: products.length
    );
  }

  Widget _buildCartIsEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
            AppVectors.cartBag
        ),
        const SizedBox(height: 20,),
        const Text(
          "Cart is empty",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),
        )
      ],
    );
  }
}