import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:flutter/cupertino.dart';

import '../api_helper/product_api.dart';

class ProductProvider extends ChangeNotifier{
    List<Data> productList=List<Data>();

  Future<List<Data>> getAllProducts() async {
    List<Data> products = await ProductApi.api.getAllProducts();
    this.productList = products;
    notifyListeners();
  }

}
