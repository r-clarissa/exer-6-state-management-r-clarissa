// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import '../provider/shoppingcart_provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        children: [
          const Text("Item Details"),
          const Divider(height: 4, color: Colors.black),
          getItems(context),
        ],)
    );
  }
  
  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
      ? const Text('No items to checkout!')
      : Expanded(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const Icon(Icons.food_bank),
                      title: Text(products[index].name),
                    );
                  },
                )
              ),
              Flexible(
                child: Column(
                  children: [
                    const Divider(height: 4, color: Colors.black),
                    computeCost(),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ShoppingCart>().removeAll();
                        ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                            content: Text("Payment Successful!"),
                            duration: Duration(seconds: 1, milliseconds: 100),
                          )
                        );
                      },
                      child: const Text("Pay Now!"),
                      ),
                  ],
                )
              )
            ],
          )
        );
  }

  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
       return Text("Total Cost to Pay: ${cart.cartTotal}");
    });
  }
}