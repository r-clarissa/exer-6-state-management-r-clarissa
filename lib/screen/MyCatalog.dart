// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import '../provider/shoppingcart_provider.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  // variable declaration
  List<Item> productsCatalog = [
    Item("Shampoo", 10.00, 2),
    Item("Soap", 12, 3),
    Item("Toothpaste", 40, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Catalog"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          // display the product list
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.star),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productsCatalog[index].name),
                        Text("Price: ${productsCatalog[index].price}",
                          style: TextStyle(fontSize: 14, color: Colors.grey,)),
                      ],
                    ),
                    TextButton(
                      child: const Text("+ Add"),
                      onPressed: () {
                        context.read<ShoppingCart>().addItem(productsCatalog[index]);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("${productsCatalog[index].name} added!"),
                          duration: const Duration(seconds: 1, milliseconds: 100),
                        ));
                      },
                    ),
                  ],
                ),
              ),
              Divider()
            ],
          );
        },
        itemCount: productsCatalog.length,
      ),
      // floating shopping cart button
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
      ),
    );
  }
}
