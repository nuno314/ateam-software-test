import 'package:ateam_software_test/presentation/modules/auth/bloc/auth_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<AuthBloc, AuthState>(
    'sign in emits loading then success',
    build: AuthBloc.new,
    act: (bloc) => bloc.add(
      SignInEvent(username: 'user', password: 'pass'),
    ),
    wait: const Duration(seconds: 3),
    expect: () => [
      isA<LoadingAuthState>(),
      isA<LoginSuccessfullyState>(),
    ],
  );
}
