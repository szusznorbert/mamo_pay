import 'package:flutter/material.dart';
import 'package:mamo_pay/domain/models/transfer_model.dart';

class UserBalanceProvider with ChangeNotifier {
  double _balance = 0.0;
  List<TransferModel> _transferHistory = [];

  double get balance => _balance;
  List<TransferModel> get transferHistory => _transferHistory;

  void setBalance(double newBalance) {
    _balance = newBalance;
    notifyListeners();
  }

  void setTransferHistory(List<TransferModel> newTransferHistory) {
    _transferHistory = newTransferHistory;
    notifyListeners();
  }
}
