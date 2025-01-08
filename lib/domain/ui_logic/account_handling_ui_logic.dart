import 'package:flutter/material.dart';
import 'package:mamo_pay/data/repository/user_repository.dart';
import 'package:mamo_pay/domain/providers/user_account_provider.dart';

import 'package:provider/provider.dart';

class AccountHandlingUiLogic {
  final UserRepository _userRepository;

  AccountHandlingUiLogic({required userRepository}) : _userRepository = userRepository;

  void fetchUserBalance(BuildContext context) {
    final userAccountProvider = Provider.of<UserBalanceProvider>(context, listen: false);
    final balance = _userRepository.fetchUserBalance();
    userAccountProvider.setBalance(balance);
  }

  void addMoney(BuildContext context) {
    const amount = 100.00;
    showDialog(context: context, builder: (context) => const AlertDialog(title: Text('100 AED has been added to your account')));
    final userAccountProvider = Provider.of<UserBalanceProvider>(context, listen: false);
    final currentBalance = userAccountProvider.balance;
    final newBalance = currentBalance + amount;
    _userRepository.updateBalance(newBalance);
    userAccountProvider.setBalance(newBalance);
  }

  void fetchTransferHistory(BuildContext context) {
    final userAccountProvider = Provider.of<UserBalanceProvider>(context, listen: false);
    final transferHistory = _userRepository.fetchTransferHistory();
    userAccountProvider.setTransferHistory(transferHistory);
  }
}
