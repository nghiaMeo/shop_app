import 'package:flutter/material.dart';
import 'package:shop_app/presentation/home/widget/header_widget.dart';

import '../widget/search_field_widget.dart';

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
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
