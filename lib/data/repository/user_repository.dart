import 'package:mamo_pay/data/local_storage/balance_local_storage.dart';
import 'package:mamo_pay/data/remote_storage/user_balance_remote_storage.dart';
import 'package:mamo_pay/domain/models/transfer_model.dart';

class UserRepository {
  final UserBalanceStorage _remoteStorage;
  final UserBalanceLocalStorage _localStorage;

  UserRepository({required remoteStorage, required localStorage})
      : _remoteStorage = remoteStorage,
        _localStorage = localStorage;

  double fetchUserBalance() {
    return _remoteStorage.fetchUserBalance();
  }

  void updateBalance(double amount) {
    _remoteStorage.updateBalance(amount);
    _localStorage.updateBalance(amount);
  }

  List<TransferModel> fetchTransferHistory() {
    return _remoteStorage.fetchTransferHistory();
  }
}
