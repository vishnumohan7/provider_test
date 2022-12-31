import 'package:flutter/cupertino.dart';

class ProductCount with ChangeNotifier {
  int productCount = 0;

  void productIncrement() {
    productCount++;
    notifyListeners();
  }

  void productDecrement() {
    productCount--;
    notifyListeners();
  }
}
