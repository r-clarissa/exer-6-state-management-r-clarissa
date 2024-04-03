# Exer 6: State Management

### Clarissa G. Rodriguez
- 2020-07354
- U-3L

### About the Application
- The application is a shopping mobile app which implemeents the cart and checkout system. It has three initial routes `/products`, `/cart`, and `/checkout`. A product has a name, price, and quantity. Its primary methods are: adding an item, removing an item, and deleting all items in the cart. It makes use of `ChangeNotifier` for updating and notifying any UI changes in the state. It also makes use of `context.read<Item>` and `context.watch<Item>` which are utilized when returning with and without listening to the changes.

### Things I Did
- As instructed, I used the current codebase from the handout.
- I have no changes in `Item.dart` because the model stays the same. This is also the same case with the `shoppigcart_provider.dart`.
- At `main.dart`, I added the route for `/checkout` to implement the checkout feature page.
- At 'MyCatalog.dart`, I have enhanced the UI.
- At `MyCart.dart`, I added an elevated button for checkout button with `Navigator.pushNamed()` method so the user will be directed to the checkout page once it is clicked. I also enhanced the UI.
- I created a new page `Checkout.dart`. Basically, if there are no checkout items, it will show the prompt of no items yet and with the total cost of 0. The pay now button is also not yet visible. If there are already checkout items from the cart, then it will show the list of these products with their corresponding prices. If the pay now was clicked, it will reset the product list at the cart and checkout, and will display a prompt of successful payment as a demo.

### Challenges in Developing the Application
- At first, I spent a quite amount of time in visualizing how would I implement the checkout feature because there will be an additional route to be considered.
- Fortunately, after listing an outline of how will the navigation and the passing of data through the additional components, I gained a better visualization on how would I code this exercise.
