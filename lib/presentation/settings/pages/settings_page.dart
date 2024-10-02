import 'package:flutter/material.dart';
import 'package:shop_app/presentation/settings/widgets/my_orders_tile_widget.dart';

import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../widgets/choose_mode_widget.dart';
import '../widgets/my_favorites_tile_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            MyFavoritesTileWidget(),
            SizedBox(height: 15),
            MyOrdersTileWidget(),
            SizedBox(height: 15),
            ChooseModeWidget()

          ],
        ),
      ),
    );
  }
}
