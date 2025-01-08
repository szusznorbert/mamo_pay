import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mamo_pay/domain/providers/user_account_provider.dart';
import 'package:mamo_pay/core/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserBalanceProvider())],
        child: MaterialApp(
            title: 'Mamo Pay',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: RouteName.intro,
            onGenerateRoute: (settings) {
              final Widget widget = routes[settings.name!];
              return MaterialPageRoute(builder: (context) => widget, settings: settings);
            }),
      ),
    );
  }
}
