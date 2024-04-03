// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import "../provider/shoppingcart_provider.dart";

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          // methods
          getItems(context), 
          computeCost(),
          const Divider(height: 4, color: Colors.black),
          // buttons
          Flexible(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // reset button
                  ElevatedButton(
                    onPressed: () {
                      context.read<ShoppingCart>().removeAll();
                    },
                    child: const Text("Reset")
                  ),
                  // checkout button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/checkout");
                    },
                    child: const Text("Checkout")
                  ),
                ]
              )
            )
          ),
          // return to /products button
          TextButton( 
            child: const Text("Go back to Product Catalog"),
            onPressed: () {
              Navigator.pushNamed(context, "/products");
            },
          ),
        ],
      ),
    );
  }

  // fetches the product data
  Widget getItems(BuildContext context) {
    // variable declaration
    List<Item> products = context.watch<ShoppingCart>().cart;
    String productname = "";
    
    // conditionals for no. of products fetched
    return products.isEmpty
      ? const Text('No Items yet!')
      : Expanded(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    // display the product list
                    return ListTile( 
                      leading: const Icon(Icons.food_bank),
                      title: Text(products[index].name),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          productname = products[index].name;
                          context.read<ShoppingCart>().removeItem(productname);
                          // display the conditional prompts
                          if (products.isNotEmpty) {
                            ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                content: Text("$productname removed!"),
                                duration: const Duration(seconds: 1, milliseconds: 100),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Cart Empty!"),
                              duration: Duration(seconds: 1, milliseconds: 100),
                            ));
                          }
                        },
                      ),
                    );
                  },
                )
              ),
            ],
          )
        );
  }

  // gets the total amount of selected items in cart
  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
       return Text("Total: ${cart.cartTotal}");
    });
  }
  
}
