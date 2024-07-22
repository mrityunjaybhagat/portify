import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:portify/models/address.dart';

class AppData with ChangeNotifier {
  late Address pickupAddress;
  void updatePickupAddress(Address pickup) {
    pickupAddress = pickup;
    notifyListeners();
  }
}
