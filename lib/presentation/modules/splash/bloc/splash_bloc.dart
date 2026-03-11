import 'dart:async';

import 'package:ateam_software_test/data/local/local_data_manager.dart';
import 'package:ateam_software_test/di/di.dart';
import 'package:ateam_software_test/presentation/modules/onboard/onboard_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashInitialEvent>(initial);
    add(SplashInitialEvent());
  }

  FutureOr<void> initial(SplashInitialEvent event, Emitter<SplashState> emit) {
    final isLaunched = injector.get<LocalDataManager>().getAppLaunched();
    var nextRoute = OnboardScreen.path;
    emit(SplashFinishState(nextRoute));
  }
}
