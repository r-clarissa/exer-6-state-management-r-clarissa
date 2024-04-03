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
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [ // checkout header
          const Center(child: Text("Item Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
          // methods
          getItems(context), 
          const SizedBox(height: 10),
        ],)
    );
  }
  
  // fetches the checkout product data
  Widget getItems(BuildContext context) {
    // variable declaration
    List<Item> products = context.watch<ShoppingCart>().cart;

    // conditionals for no. of products fetched
    return products.isEmpty
      ? const Center(child: Text('No items to checkout!'))
      : Expanded(
          child: Column(
            children: [
              // display the product list
                Flexible(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(products[index].name),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              '${products[index].price}',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              computeCost(),          
              // pay now button and prompt
              Flexible(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton( // once user clicked pay now
                        onPressed: () {
                          context.read<ShoppingCart>().removeAll(); // clear all checkout products
                          ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                              content: Text("Payment Successful!"), // display payment successful prompt
                              duration: Duration(seconds: 1, milliseconds: 100),
                            )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), 
                          ),
                        ),
                        child: const Text("Pay Now!"),
                        ),
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
       return Text("Total Cost to Pay: ${cart.cartTotal}", style: const TextStyle(fontWeight: FontWeight.bold));
    });
  }
}