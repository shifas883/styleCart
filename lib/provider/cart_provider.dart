import 'package:flutter/cupertino.dart';

import '../models/prodect_model.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  double get totalPrice {
    return _cartItems.fold(
      0.0,
          (sum, item) => sum + (item.price * item.quantity),
    );
  }

  void addToCart(Product product) {
    if (_cartItems.contains(product)) {
      product.quantity++;
    } else {
      _cartItems.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    }
  }
}
