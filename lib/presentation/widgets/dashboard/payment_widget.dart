import 'package:flutter/material.dart';
import 'package:mamo_pay/domain/models/transfer_model.dart';
import 'package:mamo_pay/presentation/design/font_sizes.dart';
import 'package:mamo_pay/presentation/design/spacing_sizes.dart';
import 'package:mamo_pay/domain/enums/transfer_type_enum.dart';

class TransferWidget extends StatelessWidget {
  final TransferModel transferModel;

  const TransferWidget({super.key, required this.transferModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SpacingSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            child: Text(
              transferModel.name.substring(0, 1),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transferModel.name,
                  style: TextStyle(fontSize: FontSizes.small),
                  textAlign: TextAlign.start,
                ),
                Text(
                  transferModel.transferType == TransferType.sent ? 'Sent' : 'Received',
                  style: TextStyle(fontSize: FontSizes.small),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            transferModel.amount.toString(),
            style: TextStyle(fontSize: FontSizes.medium),
          ),
        ],
      ),
    );
  }
}
