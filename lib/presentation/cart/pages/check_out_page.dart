import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../common/bloc/button/button_state_cubit.dart';
import '../../../common/helper/cart/cart_helper.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../common/widgets/button/basic_reactive_button.dart';
import '../../../data/order/models/order_registration_req.dart';
import '../../../domain/order/entities/product_ordered_entity.dart';
import '../../../domain/order/usecases/order_registration.dart';
import 'order_placed_page.dart';

class CheckOutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;

  CheckOutPage({required this.products, super.key});

  final TextEditingController _addressCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Checkout'),
      ),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              AppNavigator.pushAndRemove(context, OrderPlacedPage());
            }
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Builder(builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _addressField(context),
                  BasicReactiveButton(
                      content: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${CartHelper.calculateCartSubtotal(products)}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              'Place Order',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        context.read<ButtonStateCubit>().execute(
                            useCase: OrderRegistrationUseCase(),
                            params: OrderRegistrationReq(
                                products: products,
                                createdDate: DateTime.now().toString(),
                                itemCount: products.length,
                                totalPrice:
                                    CartHelper.calculateCartSubtotal(products),
                                shippingAddress: _addressCon.text));
                      })
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      controller: _addressCon,
      minLines: 2,
      maxLines: 4,
      decoration: InputDecoration(hintText: 'Shipping Address'),
    );
  }
}
