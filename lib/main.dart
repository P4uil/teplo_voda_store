import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/components/tabbar/bloc/tabbar_bloc.dart';
import 'package:teplo_voda_store/pages/catalog/bloc/catalog_bloc.dart';
import 'package:teplo_voda_store/pages/auth/auth_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabBarBloc()),
        BlocProvider(create: (context) => CatalogBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthView(),
      ),
    );
  }
}
