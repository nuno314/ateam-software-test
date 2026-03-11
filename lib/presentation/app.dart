import 'package:ateam_software_test/di/di.dart';
import 'package:ateam_software_test/presentation/modules/splash/bloc/splash_bloc.dart';
import 'package:ateam_software_test/presentation/modules/splash/splash_screen.dart';
import 'package:ateam_software_test/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        home: BlocProvider<SplashBloc>(
          create: (context) => injector.get<SplashBloc>(),
          child: SplashScreen(),
        ),
      ),
    );
  }
}
