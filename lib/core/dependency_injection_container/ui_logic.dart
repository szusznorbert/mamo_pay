import 'package:mamo_pay/core/dependency_injection_container/repository.dart';
import 'package:mamo_pay/domain/ui_logic/account_handling_ui_logic.dart';

final accountHandlingUiLogic = AccountHandlingUiLogic(userRepository: userRepository);
