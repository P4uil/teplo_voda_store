import 'package:flutter/material.dart';

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
