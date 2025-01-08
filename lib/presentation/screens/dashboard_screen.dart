import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mamo_pay/core/dependency_injection_container/ui_logic.dart';
import 'package:mamo_pay/domain/models/transfer_model.dart';
import 'package:mamo_pay/domain/providers/user_account_provider.dart';
import 'package:mamo_pay/presentation/design/colors.dart';
import 'package:mamo_pay/presentation/design/font_sizes.dart';
import 'package:mamo_pay/presentation/design/spacing_sizes.dart';
import 'package:mamo_pay/presentation/widgets/dashboard/circle_button_with_text.dart';
import 'package:mamo_pay/presentation/widgets/dashboard/payment_widget.dart';

import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      accountHandlingUiLogic.fetchUserBalance(context);
      accountHandlingUiLogic.fetchTransferHistory(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: SpacingSizes.xl, horizontal: SpacingSizes.xxl),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mamo Pay balance',
                          style: TextStyle(fontSize: FontSizes.large, color: Colors.white),
                        ),
                        const CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Text('A')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'AED',
                          style: TextStyle(fontSize: FontSizes.title, color: Colors.white),
                        ),
                        Selector<UserBalanceProvider, double>(
                            selector: (context, provider) => provider.balance,
                            builder: (context, balance, _) {
                              return Text(
                                balance.toStringAsFixed(2),
                                style: TextStyle(fontSize: FontSizes.title, color: Colors.white),
                              );
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: SpacingSizes.xl),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleButtonWithText(
                          onPressed: () => accountHandlingUiLogic.addMoney(context),
                          icon: const Icon(Icons.add),
                          text: 'Top up',
                        ),
                        CircleButtonWithText(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                          text: 'Send Money',
                        ),
                        CircleButtonWithText(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz),
                          text: 'More',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Selector<UserBalanceProvider, List<TransferModel>>(
                  selector: (context, provider) => provider.transferHistory,
                  builder: (context, transferHistory, _) {
                    final bool isNotEmpty = (transferHistory.isNotEmpty);
                    return isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                itemCount: transferHistory.length,
                                padding: const EdgeInsets.all(8.0),
                                itemBuilder: (context, index) => TransferWidget(transferModel: transferHistory[index])),
                          )
                        : Container();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
