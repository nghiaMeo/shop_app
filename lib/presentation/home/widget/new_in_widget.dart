import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/product/products_display_cubit.dart';
import '../../../common/bloc/product/products_display_state.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/product/product_card.dart';
import '../../../domain/product/entities/product_entity.dart';

import '../../../domain/product/usecases/get_new_in.dart';
import '../../../service_locator.dart';

class NewInWidget extends StatelessWidget {
  const NewInWidget({super.key});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(useCase: sl<GetNewInUseCase>())..displayProducts(),
      child: BlocBuilder < ProductsDisplayCubit, ProductsDisplayState > (
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTopSelling(context),
                const SizedBox(height: 20, ),
                _buildListProducts(state.products)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildTopSelling(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'New In',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, Container());
            },
            child: Text(
              'See All',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListProducts(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) {
            return ProductCard(
              productEntity: products[index],
            );
          },
          separatorBuilder: (context,index) => const SizedBox(width: 10,),
          itemCount: products.length
      ),
    );
  }
}
