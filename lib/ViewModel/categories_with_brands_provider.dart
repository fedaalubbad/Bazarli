import 'package:bazarli/api_helper/categories_with_brands_helper.dart';
import 'package:bazarli/models/Categories_model/categories_with_brands_response.dart';
import 'package:flutter/cupertino.dart';

class CategoriesWithBrandsProvider extends ChangeNotifier {
  Category selectedCategory = null;
  int selectedIndex = 0;

  selectCategory(Category category) {
    selectedCategory = category;
    notifyListeners();
  }

  selectIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Brand> brands;
  List<Category> children;

  getSubCategories(index) {
    children = categoriesWithBrandsResponse.categories[index].children;
    notifyListeners();
  }

  getBrands(index) {
    brands = categoriesWithBrandsResponse.categories[index].brands;
    notifyListeners();
  }

  CategoriesWithBrandsResponse categoriesWithBrandsResponse;

  Future<CategoriesWithBrandsResponse> getCategoriesWithBrands(
      {lang, id}) async {
    CategoriesWithBrandsResponse response =
        await CategoriesWithBrandsApi.api.getCategoriesWithBrands(lang:lang,id:id);
      categoriesWithBrandsResponse = response;
      notifyListeners();
      getBrands(0);
      getSubCategories(0);
      notifyListeners();

    return categoriesWithBrandsResponse;
  }
}
