import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_demo/provider/increment.dart';

import 'package:provider_demo/provider/product_count.dart';
import 'package:provider_demo/provider/products_provider.dart';

import 'package:provider_demo/ui/product_page.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Increment()),
        ChangeNotifierProvider(create: (_) => ProductCount()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Increment(),
      child: MaterialApp(
        home: ProductsPage(),
      ),
    );
  }
}
