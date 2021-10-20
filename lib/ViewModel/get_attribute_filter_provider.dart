import 'package:bazarli/api_helper/attribute_filter_helper.dart';
import 'package:bazarli/models/arrivals_response/arrivals_response.dart';
import 'package:bazarli/models/get_attribute_filter/get_attribute_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
class AttributeFilterProvider extends ChangeNotifier{
  List<GetAttributeFilter> getAttributeFilter;
  List<ArrivalsResponse> getArrivalsList;

  Future<List<GetAttributeFilter>> getAttributeFliter (BuildContext context,attribute)async{
    List<GetAttributeFilter> response=await AttributeFilterApi.api.getAttributeFilter(context, attribute,'en');
    getAttributeFilter=response;
    notifyListeners();
    return response;

  }
  Future<List<ArrivalsResponse>> getArrivals (BuildContext context)async{
    List<ArrivalsResponse> response=await AttributeFilterApi.api.getArrivals(context);
    getArrivalsList=response;
    notifyListeners();
    return response;

  }

}