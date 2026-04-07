import 'package:ateam_software_test/presentation/modules/auth/auth_route.dart';
import 'package:ateam_software_test/presentation/modules/dashboard/dashboard_route.dart';
import 'package:ateam_software_test/presentation/modules/onboard/onboard_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
    ...OnboardRoute.getAll(settings),
    ...AuthRoute.getAll(settings),
    ...DashboardRoute.getAll(settings),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;
    final routes = _getAll(settings);
    final WidgetBuilder? builder =
        (name == null || name.isEmpty) ? null : routes[name];
    if (builder == null) {
      return buildRoute(
        (context) => const PageNotFoundScreen(),
        settings: settings,
      );
    }
    return buildRoute(builder, settings: settings);
  }
}

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'This page could not be found.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route buildRoute<T>(WidgetBuilder builder, {RouteSettings? settings}) {
  return CupertinoPageRoute<T>(builder: builder, settings: settings);
}
