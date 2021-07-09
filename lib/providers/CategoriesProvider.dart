import 'package:bazarli/api_helper/categories_api.dart';
import 'package:bazarli/models/Categories_model/categories_classes/category.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider extends ChangeNotifier{
  List<Categories> categoriesList=List<Categories>();

  Future<List<Categories>> getAllCategories() async {
    List<Categories> categories = await CategoryApi.api.getAllCategories();
    this.categoriesList = categories;
    notifyListeners();
  }

}
