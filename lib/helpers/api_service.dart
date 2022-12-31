import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_demo/models/ProductsModel.dart';

class ApiService {
  Future<List<ProductsModel>> getAllProducts() async {
    List<ProductsModel> products = [];
    try {
      var response = await http.get(
          Uri.parse("https://fakestoreapi.com/products/"),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        products = data.map((e) => ProductsModel.fromJson(e)).toList();
      }
    } catch (ex) {
      print(ex);
    } finally {
      return products;
    }
  }
}
