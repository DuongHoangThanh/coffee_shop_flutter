import 'package:coffee_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    Coffee(
        name: "Latte", price: "4.2", imagePath: "lib/images/coffee-cup-2.png"),
    Coffee(name: "Americano", price: "4.2", imagePath: "lib/images/black.png"),
    Coffee(
        name: "StartBuck", price: "4.2", imagePath: "lib/images/espresso.png"),
    Coffee(name: "Highland", price: "4.2", imagePath: "lib/images/latte.png")
  ];
  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
