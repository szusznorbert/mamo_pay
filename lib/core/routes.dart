import 'package:mamo_pay/presentation/screens/dashboard_screen.dart';
import 'package:mamo_pay/presentation/screens/intro_screen.dart';

class RouteName {
  static const String intro = 'intro_screen';
  static const String dashboard = 'dashboard_screen';
}

final Map routes = {
  RouteName.intro: const IntroScreen(),
  RouteName.dashboard: const DashboardScreen(),
};
