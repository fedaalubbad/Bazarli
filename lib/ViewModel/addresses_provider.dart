import 'dart:convert';
import 'package:bazarli/models/get_cities_respons/get_cities_respons.dart';
import 'package:bazarli/models/message_response/message_response.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:bazarli/view/Authentication/widgets/FormError.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bazarli/api_helper/addresses_helper.dart';
import 'package:bazarli/models/address_model/createAddress_model.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:flutter/material.dart';

class AddressesProvider extends ChangeNotifier {
  List<Datum> addressList = [];
  List<GetCitiesResponse> getCitiesResponseList;
  GetCitiesResponse selectedCity;

  final GlobalKey<FormState> addressesFormStateKey = GlobalKey<FormState>();

  String country;
   var address1;
   String address2;
   String state;
   String city;
   String postcode;
   String phone;
   String phone_code;
   String title;
   String FName;
   String LName;

  void selectCity(val){
     selectedCity=val;
     notifyListeners();
}

selectTitle(val){
   title=val;
   notifyListeners();
}
savePhone(val){
    phone=val;
    notifyListeners();
}
savePhoneCode(val){
    phone_code=val;
    notifyListeners();
}

saveFName(val){
    FName=val;
    notifyListeners();
}

saveLName(val){
    LName=val;
    notifyListeners();
}

String validateFName(String val){
    if(val.length==0)
      return  'enter first name';
      return null;
}
String validateLName(String val){
    if(val.length==0)
      return  'enter last name';
      return null;
}
String validatePhone(String val){
    if(val.length==0)
      return  'enter phone no';
      return null;
}
String validatePhoneCode(String val){
    if(val.length==0)
      return 'enter phone code';
      return null;
}


  Future< List<GetCitiesResponse>> getCKuwitCities() async {
    List<GetCitiesResponse> response = await AddressesApi.api.getKuwitCities();
    this.getCitiesResponseList=response;
    notifyListeners();
    return getCitiesResponseList;
  }

  Future<List<Datum>> getCustomerAddresses() async {
    GetAddress address = await AddressesApi.api.getCustomerAddresses();
    this.addressList=address.data;
    notifyListeners();
    return addressList;
  }

    Future<CreateAddress> createNewAddress(BuildContext context) async {
      final updatedAddress = await AddressesApi.api.createAddress(context,jsonEncode(['address1']),'Kuwait',' state',selectedCity.text,'395004',
          phone,phone_code,SPHelper.spHelper.getUSer().firstName,SPHelper.spHelper.getUSer().lastName,title);

         _showToast(context,updatedAddress.message);
          return updatedAddress;
    }

    Future<CreateAddress> updateAddress(productId,BuildContext context) async {
      final address = await AddressesApi.api.updateAddress(context,productId,jsonEncode(['address1']),' country',' state',' city',' postcode',
          'phone', 'first_name', 'last_name');
         _showToast(context,address.message);
          return address;
    }

    Future<MessageResponse> deleteAddress(BuildContext context,addressId) async {
      final response = await AddressesApi.api.deleteAddress(context,addressId.toString());

    }

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        // action: SnackBarAction(label: 'Done', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  // user defined function
  void submitDeleteAddressDialog(BuildContext context, msg,addressId) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("cancel").tr(),
      onPressed: () {

        Navigator.of(context).pop();
      },
    );  // set up the buttons
    Widget submitButton = FlatButton(
      child: Text("Submit").tr(),
      onPressed: () async{
       await deleteAddress(context,addressId);
       getCustomerAddresses();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("Error"),
      content: FormError(
        errors: [msg],
      ),
      actions: [
        submitButton,
        cancelButton,
      ],
    );
    showDialog(builder: (context) => alert, context: context);
  }

}
