import 'package:flutter/cupertino.dart';
import 'package:provider_demo/helpers/api_service.dart';
import 'package:provider_demo/models/ProductsModel.dart';

class ProductsProvider with ChangeNotifier {
  ApiService apiService = ApiService();

  Future<List<ProductsModel>> getAllProducts() async {
    List<ProductsModel> products = await apiService.getAllProducts();
    notifyListeners();
    return products;
  }
}
