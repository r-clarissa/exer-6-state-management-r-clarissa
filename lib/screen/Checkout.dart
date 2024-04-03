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
    return Scaffold( // checkout scaffold
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        children: [ // checkout header
          const Text("Item Details"),
          const Divider(height: 4, color: Colors.black),
          getItems(context), // display the current checkout products
        ],)
    );
  }
  
  // fetches the checkout product data
  Widget getItems(BuildContext context) {
    // variable declaration
    List<Item> products = context.watch<ShoppingCart>().cart;

    // conditionals for no. of products fetched
    return products.isEmpty
      ? const Text('No items to checkout!')
      : Expanded(
          child: Column(
            children: [
              // display the product list
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
              // pay now button and prompt
              Flexible(
                child: Column(
                  children: [
                    const Divider(height: 4, color: Colors.black),
                    computeCost(), // compute total cost before payment
                    ElevatedButton( // once user clicked pay now
                      onPressed: () {
                        context.read<ShoppingCart>().removeAll(); // clear all checkout products
                        ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                            content: Text("Payment Successful!"), // display payment successful prompt
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

  // gets the total amount of checkout items
  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
       return Text("Total Cost to Pay: ${cart.cartTotal}");
    });
  }
}