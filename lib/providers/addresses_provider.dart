import 'package:bazarli/api_helper/addresses_helper.dart';
import 'package:bazarli/models/address_model/data.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:flutter/cupertino.dart';

class AddressesProvider extends ChangeNotifier {
  // List<Address> addressList = [];

  Future<GetAddress> getCustomerAddresses() async {
    final address = await AddressesApi.api.getCustomerAddresses();
    return address;

    // List<dynamic> mapList = await AddressesApi.api.getCustomerAddresses();
    // if (mapList.isEmpty) {
    //   return addressList;
    // } else {
    //   this.addressList = mapList.map((e) => Address.fromJson(e)).toList();
    //   notifyListeners();
    //   return addressList;
    // }
  }
}
