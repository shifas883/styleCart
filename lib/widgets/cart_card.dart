import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/models/prodect_model.dart';


class CartCard extends StatelessWidget {
  final Product product;
  final VoidCallback addTap;
  final VoidCallback removeTap;
  final VoidCallback closeTap;
  const CartCard({super.key, required this.product, required this.addTap, required this.removeTap, required this.closeTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black, width: 0.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image,
            height: 76,
            width: 76,
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.pink.shade500,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8,
                    vertical: 2),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 0.2
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  spacing: 5,
                  children: [
                    InkWell(
                      child: Icon(Icons.remove),
                      onTap: removeTap
                    ),
                    Text(
                      product.quantity.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Icon(Icons.add),
                      onTap: addTap
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            child: Icon(Icons.close),
            onTap: closeTap
          ),
        ],
      ),
    );
  }
}
