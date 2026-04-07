import 'package:ateam_software_test/presentation/modules/dashboard/dashboard_screen.dart';
import 'package:ateam_software_test/presentation/routes/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('generateRoute uses fallback when name is null', () {
    final route = RouteGenerator.generateRoute(const RouteSettings(name: null));
    expect(route, isA<CupertinoPageRoute<dynamic>>());
  });

  test('generateRoute uses fallback when name is unknown', () {
    final route = RouteGenerator.generateRoute(
      const RouteSettings(name: '__unknown__'),
    );
    expect(route, isA<CupertinoPageRoute<dynamic>>());
  });

  test('generateRoute returns route for dashboard', () {
    final route = RouteGenerator.generateRoute(
      RouteSettings(name: DashboardScreen.path),
    );
    expect(route, isA<CupertinoPageRoute<dynamic>>());
  });

  testWidgets('unknown initialRoute shows Page Not Found', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '__unknown__',
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Page Not Found'), findsOneWidget);
    expect(find.text('This page could not be found.'), findsOneWidget);
  });

  testWidgets('PageNotFoundScreen', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: PageNotFoundScreen()));
    expect(find.text('Go back'), findsOneWidget);
  });
}
