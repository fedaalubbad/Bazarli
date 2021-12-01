import 'package:bazarli/models/Categories_model/categories_with_brands_response.dart';
import 'package:bazarli/models/reviews_model/give_review_response.dart';
import 'package:bazarli/models/reviews_model/review_classes/review_data.dart';
import 'package:dio/dio.dart';
import 'constants_urls.dart';
import 'dio_settings.dart';

class CategoriesWithBrandsApi{
  CategoriesWithBrandsApi._();
  static CategoriesWithBrandsApi api=CategoriesWithBrandsApi._();

  Future<CategoriesWithBrandsResponse> getCategoriesWithBrands({lang, id}) async{
    try{
      String link;
      if(id!=null)
        link=GET_CATEGORIES_WITH_BRANDS_URL+'&locale=$lang&category_id=$id';
      else
        link=GET_CATEGORIES_WITH_BRANDS_URL+'&locale=$lang';

      Response response = await Settings.settings.dio.get(link);

    Map<String,dynamic> responseBody=response.data;
    print('categorieswithbrandsJson${responseBody}');
    CategoriesWithBrandsResponse categoriesWithBrandsResponse = CategoriesWithBrandsResponse.fromJson(responseBody);
    print('categorieswithbrands${categoriesWithBrandsResponse}');
    return categoriesWithBrandsResponse;
    } on DioError catch (e) {
        print('categorieswithbrandsError $e');
      throw Exception();
    }
  }






}