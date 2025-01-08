import 'package:mamo_pay/domain/enums/transfer_type_enum.dart';

class TransferModel {
  final String name;
  final double amount;
  final TransferType transferType;
  final String imageUrl;

  TransferModel({required this.name, required this.amount, required this.transferType, required this.imageUrl});

  TransferModel fromJson(Map<String, dynamic> json) {
    return TransferModel(
      name: json['name'],
      amount: json['amount'],
      transferType: json['transferType'],
      imageUrl: json['imageUrl'],
    );
  }
}
