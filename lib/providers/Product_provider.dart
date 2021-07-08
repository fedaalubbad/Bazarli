import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:flutter/cupertino.dart';

import '../api.dart';

class ProductProvider extends ChangeNotifier{
    List<Product> productList;

  Future<List<Product>> getAllProducts() async {
    List<Product> users = await Api.api.getAllProducts();
    this.productList = users;
    notifyListeners();
  }

}
