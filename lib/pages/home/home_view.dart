import 'package:flutter/material.dart';
import 'package:teplo_voda_store/pages/catalog/catalog_view.dart';
import 'package:teplo_voda_store/pages/cart/cart_view.dart';
import 'package:teplo_voda_store/pages/catalog/pages/sewerage.dart';
import 'package:teplo_voda_store/pages/profile/profile_view.dart';
import 'package:teplo_voda_store/pages/search/search_view.dart';
import 'package:teplo_voda_store/pages/store/store_view.dart';

import '../../components/tabbar/tabbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TabBarViewWidget(), // Replace IndexedStack with TabBarViewWidget
    );
  }
}
