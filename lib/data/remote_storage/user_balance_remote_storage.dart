import 'package:mamo_pay/domain/enums/transfer_type_enum.dart';
import 'package:mamo_pay/domain/models/transfer_model.dart';

class UserBalanceStorage {
  UserBalanceStorage();

  double fetchUserBalance() {
    /* TODO remove the mock data after the API connection is done */
    return 2179.00;
  }

  void updateBalance(double newBalance) {
    /* ToDo call the update API */
  }

  List<TransferModel> fetchTransferHistory() {
    /* ToDo remove then mock data when the API will be realized  */
    return [
      TransferModel(name: "Hayfa Saliba", amount: 350.0, transferType: TransferType.received, imageUrl: ""),
      TransferModel(name: "Norbert Saliba", amount: 350.0, transferType: TransferType.sent, imageUrl: ""),
      TransferModel(name: "karima Tahan", amount: 150.0, transferType: TransferType.sent, imageUrl: ""),
      TransferModel(name: "Moe Khalifa", amount: 850.0, transferType: TransferType.received, imageUrl: ""),
      TransferModel(name: "Hayfa Saliba", amount: 1350.0, transferType: TransferType.received, imageUrl: ""),
      TransferModel(name: "Hayfa Saliba", amount: 350.0, transferType: TransferType.received, imageUrl: ""),
      TransferModel(name: "Norbert Saliba", amount: 350.0, transferType: TransferType.sent, imageUrl: ""),
      TransferModel(name: "karima Tahan", amount: 150.0, transferType: TransferType.sent, imageUrl: ""),
      TransferModel(name: "Moe Khalifa", amount: 850.0, transferType: TransferType.received, imageUrl: ""),
      TransferModel(name: "Hayfa Saliba", amount: 1350.0, transferType: TransferType.received, imageUrl: ""),
    ];
  }
}
