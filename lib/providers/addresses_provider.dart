import 'dart:convert';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bazarli/api_helper/addresses_helper.dart';
import 'package:bazarli/models/address_model/createAddress_model.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:bazarli/ui/Authentication/widgets/FormError.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressesProvider extends ChangeNotifier {
  List<Datum> addressList = [];
  final GlobalKey<FormState> addressesFormStateKey = GlobalKey<FormState>();

  String country;
   var address1;
   String address2;
   String state;
   String city;
   String postcode;
   String phone;
  Future<List<Datum>> getCustomerAddresses() async {
    GetAddress address = await AddressesApi.api.getCustomerAddresses();
    this.addressList=address.data;
    notifyListeners();
    return addressList;
  }

    Future<CreateAddress> createNewAddress(BuildContext context) async {
      final updatedAddress = await AddressesApi.api.createAddress(context,jsonEncode(['address1']),' country',' state',' city',' postcode',
          'phone',SPHelper.spHelper.getUSer().firstName,SPHelper.spHelper.getUSer().lastName);

         _showToast(context,updatedAddress.message);
          return updatedAddress;
    }

    Future<CreateAddress> updateAddress(productId,BuildContext context) async {
      final address = await AddressesApi.api.updateAddress(context,productId,jsonEncode(['address1']),' country',' state',' city',' postcode',
          'phone', 'first_name', 'last_name');
         _showToast(context,address.message);
          return address;
    }

    Future deleteAddress(BuildContext context,addressId) async {
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
