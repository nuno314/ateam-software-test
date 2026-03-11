import 'package:ateam_software_test/di/di.dart';
import 'package:ateam_software_test/presentation/modules/auth/bloc/auth_bloc.dart';
import 'package:ateam_software_test/presentation/modules/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthRoute {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
    LoginScreen.path: (context) => BlocProvider<AuthBloc>(
      create: (context) => injector.get(),
      child: LoginScreen(),
    ),
  };
}
