import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/prodect_model.dart';

class ApiService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

   try{
     if (response.statusCode == 200) {
       List<dynamic> data = json.decode(response.body);
       return data.map((item) => Product.fromJson(item)).toList();
     } else {
       throw Exception('Failed to load products');
     }
   }
   catch(e){
     print("PPPPP$e");
   }
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
