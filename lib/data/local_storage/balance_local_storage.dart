import 'package:shared_preferences/shared_preferences.dart';

class UserBalanceLocalStorage {
  Future<double> getBalance() async {
    final prefs = await SharedPreferences.getInstance();
    final balance = prefs.getDouble('BALANCE');
    if (balance == null) {
      return 0.0;
    }
    return balance;
  }

  Future<void> updateBalance(double newBalance) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('BALANCE', newBalance);
  }
}
