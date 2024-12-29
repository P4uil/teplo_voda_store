import 'package:flutter/material.dart';
import 'package:teplo_voda_store/pages/auth/auth_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TeploVoda',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AuthView(),
    );
  }
}
