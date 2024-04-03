import 'package:flutter/material.dart';
import 'package:week6/screen/MyCart.dart';
import 'package:week6/screen/MyCatalog.dart';
import 'package:week6/screen/Checkout.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(),
        "/checkout": (context) => const Checkout(),
        "/products": (context) => const MyCatalog(),
      },
      home: const MyCatalog(),
    );
  }
}
