import 'package:mamo_pay/core/dependency_injection_container/local_storage.dart';
import 'package:mamo_pay/core/dependency_injection_container/remote_storage.dart';
import 'package:mamo_pay/data/repository/user_repository.dart';

final userRepository = UserRepository(remoteStorage: userBalanceRemoteStorage, localStorage: userBalanceLocalStorage);
