import 'package:bazarli/api_helper/categories_api.dart';
import 'package:bazarli/models/Categories_model/categories_classes/category.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider extends ChangeNotifier{
  List<Categories> categoriesList=[];

  Future<List<Categories>> getAllCategories() async {
    List<Categories> categories = await CategoryApi.api.getAllCategories();
    this.categoriesList = categories;
    notifyListeners();
    return categoriesList;
  }
  Future<void> addData() async {

    this.categoriesList.add(new Categories(id:55,slug: '5',name: 'fedaa',subCategories: []));
      notifyListeners();
    }
}
