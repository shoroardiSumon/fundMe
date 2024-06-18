import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier{
  bool _isSavePaymentMethod = false;

  bool get isSavePaymentMethod => _isSavePaymentMethod;

  void updateIsSavePaymentMethod(bool isSave){
    _isSavePaymentMethod = isSave;
    notifyListeners();
  }
}