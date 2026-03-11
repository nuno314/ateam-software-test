import 'package:ateam_software_test/di/di.dart';
import 'package:ateam_software_test/presentation/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:ateam_software_test/presentation/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardRoute {
   static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
    DashboardScreen.path: (context) => BlocProvider<DashboardCubit>(
      create: (context) => injector.get(),
      child: DashboardScreen(),
    ),
  };
}