import 'package:flutter/material.dart';
import 'package:shop_app/presentation/home/widgets/categories_widget.dart';
import 'package:shop_app/presentation/home/widgets/header_widget.dart';
import 'package:shop_app/presentation/home/widgets/new_in_widget.dart';

import '../widgets/search_field_widget.dart';
import '../widgets/top_selling_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList.list(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderWidget(),
                  SizedBox(height: 20),
                  SearchFieldWidget(),
                  SizedBox(height: 20),
                  CategoriesWidget(),
                  SizedBox(height: 20),
                  TopSellingWidget(),
                  SizedBox(height: 20),
                  NewInWidget(),

                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
