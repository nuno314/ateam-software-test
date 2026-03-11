import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthState()) {
    on<SignInEvent>(_onSignInEvent);
  }

  FutureOr<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingAuthState());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoginSuccessfullyState());
  }
}
