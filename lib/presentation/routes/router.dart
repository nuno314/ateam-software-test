import 'package:ateam_software_test/presentation/modules/auth/auth_route.dart';
import 'package:ateam_software_test/presentation/modules/dashboard/dashboard_route.dart';
import 'package:ateam_software_test/presentation/modules/onboard/onboard_route.dart';
import 'package:flutter/cupertino.dart';

class RouteGenerator {
  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
    ...OnboardRoute.getAll(settings),
    ...AuthRoute.getAll(settings),
    ...DashboardRoute.getAll(settings),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = _getAll(settings)[settings.name!];

    return buildRoute(
      builder ?? (context) => const SizedBox(),
      settings: settings,
    );
  }
}

Route buildRoute<T>(WidgetBuilder builder, {RouteSettings? settings}) {
  return CupertinoPageRoute<T>(builder: builder, settings: settings);
}
