import 'dart:io';

import 'package:flutter/cupertino.dart';

class GlobalProvider extends ChangeNotifier{

  Future<bool> checkInternetConnection()async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }
}