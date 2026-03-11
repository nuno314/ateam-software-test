import 'package:ateam_software_test/presentation/modules/onboard/onboard_screen.dart';
import 'package:flutter/material.dart';

class OnboardRoute {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        OnboardScreen.path: (context) => OnboardScreen(),
      };
}
