import 'dart:convert';

import 'package:bazarli/models/arrivals_response/arrivals_response.dart';
import 'package:bazarli/models/get_attribute_filter/get_attribute_filter.dart';
import 'package:dio/dio.dart';
import 'constants_urls.dart';
import 'dio_settings.dart';

class AttributeFilterApi {
  AttributeFilterApi._();

  static AttributeFilterApi api = AttributeFilterApi._();

  Future<List<GetAttributeFilter>> getAttributeFilter(context, attribute,
      lang) async {
    try {
      Response response = await Settings.settings.dio.get(
          GET_ATTRIBUTES_FILTER_URL + attribute + '&language=$lang');
      if (response.statusCode < 400) {
        List<dynamic> searchResponse = response.data;
        List<GetAttributeFilter> ls = searchResponse.map((e) {
          return GetAttributeFilter.fromJson(e);
        }).toList();
        print('attribute' + ls.first.toString());
        return ls;
      } else {
        print('attributeError' + response.data);
      }
    } on Exception catch (e) {
      print('attributeError' + e.toString());
      return null;
    }
  }

  Future<List<ArrivalsResponse>> getArrivals(context) async {
    try {
      Response response = await Settings.settings.dio.get(GET_ARRIVALS_URL);
      if (response.statusCode < 400) {
        List<dynamic> searchResponse = response.data;
        List<ArrivalsResponse> ls = searchResponse.map((e) {
          return ArrivalsResponse.fromJson(e);
        }).toList();
        print('arrivals' + ls.first.toString());
        return ls;
      } else {
        print('arrivalsError' + response.data);
      }
    } on Exception catch (e) {
      print('arrivalsError' + e.toString());
      return null;
    }
  }
}
