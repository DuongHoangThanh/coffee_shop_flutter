import 'package:coffee_app/components/coffee_tile.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: Column(
            children: [
              // heading
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),

              // list of cart items
              Expanded(
                  child: ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (context, index) {
                        // get individual cart items
                        Coffee eachCoffee = value.userCart[index];

                        // return coffee tile
                        return CoffeeTile(
                          coffee: eachCoffee,
                          icon: const Icon(Icons.delete),
                          onPressed: () => removeFromCart(eachCoffee),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
