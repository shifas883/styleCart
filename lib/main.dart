import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/provider/cart_provider.dart';
import 'package:mini_ecommerce_app/screens/product_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MiniECommerceApp());
}

class MiniECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini E-commerce App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ProductListPage(),
      ),
    );
  }
}
