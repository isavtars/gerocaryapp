import 'package:flutter/material.dart';
import 'package:gerocaryapp/models/product.dart';

import '../models/product_items.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductItems> cart = [];

  int quintity = 1;

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addProductToCart(Product product) {
    for (ProductItems item in cart) {
      if (item.product!.titleName == product.titleName) {
        item.increment();

        notifyListeners();
        return;
      }
    }
    cart.add(ProductItems(product: product));
    notifyListeners();
  }

  void incrementQuantity() {
    for (ProductItems item in cart) {
      item.increment();

      notifyListeners();
    }
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (ProductItems item in cart) {
      totalPrice += double.parse(item.product!.prices) * item.quintity;
    }
    return totalPrice;
  }

  int totalCartItems() => cart.fold(
      0, (previousValue, element) => previousValue + element.quintity);
}
