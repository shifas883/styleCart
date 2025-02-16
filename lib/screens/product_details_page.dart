

import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../models/prodect_model.dart';
import '../provider/cart_provider.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});
  bool isInCart=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        title: Text(
          product.title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(product.image, height: 300),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.description,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              // Check if product is already in the cart
               isInCart = cartProvider.cartItems.contains(product);

              return ConfirmButton(
                width: 200,
                onTap: () {
                  if(isInCart){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Already in Cart')),
                    );
                  }
                  else{
                    cartProvider.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to Cart')),
                    );
                  }

                },
                text: isInCart ? 'In Cart' : 'Add to Cart',
              );
            },
          ),
        ],
      ),
    );
  }
}
