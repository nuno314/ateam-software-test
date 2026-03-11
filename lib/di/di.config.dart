// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/local/local_data_manager.dart' as _i921;
import '../presentation/modules/auth/bloc/auth_bloc.dart' as _i220;
import '../presentation/modules/splash/bloc/splash_bloc.dart' as _i832;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.factory<_i220.AuthBloc>(() => _i220.AuthBloc());
  gh.factory<_i832.SplashBloc>(() => _i832.SplashBloc());
  gh.singleton<_i921.LocalDataManager>(() => _i921.LocalDataManager());
  return getIt;
}
