import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:dio/dio.dart';
import 'constants.dart';
import 'dio_settings.dart';

class BrandApi {
  BrandApi._();

  static BrandApi api = BrandApi._();
  // Dio dio = Dio();


  Future<BrandResponse> getAllBrands() async {
    try {
      Response response = await Settings.settings.dio.get(GET_BRANDS_URL);
      if (response.statusCode < 400) {
        Map<String, dynamic> responseBody = response.data;
        print('brandListJson${responseBody}');

        BrandResponse brandResponse=BrandResponse.fromJson(responseBody);
        return brandResponse;
        } else {
        print('brands'+response.data);
        }
  } on Exception catch (e) {
  print('brandserror'+e.toString());
  return null;
  }
}

}