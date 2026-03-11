import 'package:ateam_software_test/presentation/modules/onboard/onboard_screen.dart';
import 'package:ateam_software_test/presentation/modules/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc get bloc => BlocProvider.of(context);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      builder: (context, state) {
        return SizedBox();
      },
      listener: (context, state) {
        final nextScreen = state.nextScreen ?? OnboardScreen.path;
        Navigator.pushNamedAndRemoveUntil(context, nextScreen, (_) => false);
      },
    );
  }
}
