import 'package:bazarli/api_helper/attribute_filter_helper.dart';
import 'package:bazarli/models/get_attribute_filter/get_attribute_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
class AttributeFilterProvider extends ChangeNotifier{
  List<GetAttributeFilter> getAttributeFilter;

  Future<List<GetAttributeFilter>> getAttributeFliter (BuildContext context,attribute)async{
    List<GetAttributeFilter> response=await AttributeFilterApi.api.getAttributeFilter(context, attribute,'en');
    getAttributeFilter=response;
    notifyListeners();
    return response;

  }

}