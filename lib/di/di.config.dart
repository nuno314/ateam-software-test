// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/local/local_data_manager.dart' as _i921;
import '../data/modules/explore/provider/explore_api_provider.dart' as _i98;
import '../data/modules/explore/repository/explore_repository.dart' as _i295;
import '../data/modules/home/provider/home_api_provider.dart' as _i789;
import '../data/modules/home/repository/home_repository.dart' as _i269;
import '../data/remote/app_api_service.dart' as _i108;
import '../presentation/modules/auth/bloc/auth_bloc.dart' as _i220;
import '../presentation/modules/dashboard/chat/bloc/chat_bloc.dart' as _i646;
import '../presentation/modules/dashboard/chat/chat_interactor.dart' as _i467;
import '../presentation/modules/dashboard/cubit/dashboard_cubit.dart' as _i460;
import '../presentation/modules/dashboard/explore/bloc/explore_bloc.dart'
    as _i278;
import '../presentation/modules/dashboard/explore/interactor/explore_interactor.dart'
    as _i863;
import '../presentation/modules/dashboard/home/bloc/home_page_bloc.dart'
    as _i275;
import '../presentation/modules/dashboard/home/interactor/home_interactor.dart'
    as _i276;
import '../presentation/modules/dashboard/profile/bloc/profile_bloc.dart'
    as _i625;
import '../presentation/modules/dashboard/profile/profile_interactor.dart'
    as _i245;
import '../presentation/modules/dashboard/saved/bloc/saved_bloc.dart' as _i834;
import '../presentation/modules/dashboard/saved/saved_interactor.dart' as _i704;
import '../presentation/modules/splash/bloc/splash_bloc.dart' as _i832;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final exploreApiModule = _$ExploreApiModule();
  final homeApiModule = _$HomeApiModule();
  gh.factory<_i108.AppApiService>(() => _i108.AppApiService());
  gh.factory<_i220.AuthBloc>(() => _i220.AuthBloc());
  gh.factory<_i467.ChatInteractor>(() => _i467.ChatInteractor());
  gh.factory<_i275.HomePageBloc>(() => _i275.HomePageBloc());
  gh.factory<_i245.ProfileInteractor>(() => _i245.ProfileInteractor());
  gh.factory<_i704.SavedInteractor>(() => _i704.SavedInteractor());
  gh.factory<_i832.SplashBloc>(() => _i832.SplashBloc());
  gh.singleton<_i921.LocalDataManager>(() => _i921.LocalDataManager());
  gh.singleton<_i460.DashboardCubit>(() => _i460.DashboardCubit());
  gh.factory<_i276.HomeInteractor>(() => _i276.HomeInteractorImpl());
  gh.factory<_i98.ExploreApiProvider>(
      () => exploreApiModule.exploreApiProvider(gh<_i108.AppApiService>()));
  gh.factory<_i789.HomeApiProvider>(
      () => homeApiModule.homeApiProvider(gh<_i108.AppApiService>()));
  gh.factory<_i863.ExploreInteractor>(() => _i863.ExploreInteractorImpl());
  gh.factory<_i646.ChatBloc>(() => _i646.ChatBloc(gh<_i467.ChatInteractor>()));
  gh.factory<_i834.SavedBloc>(
      () => _i834.SavedBloc(gh<_i704.SavedInteractor>()));
  gh.factory<_i625.ProfileBloc>(
      () => _i625.ProfileBloc(gh<_i245.ProfileInteractor>()));
  gh.factory<_i278.ExploreBloc>(
      () => _i278.ExploreBloc(gh<_i863.ExploreInteractor>()));
  gh.factory<_i269.HomeRepository>(
      () => _i269.HomeRepositoryImpl(gh<_i789.HomeApiProvider>()));
  gh.factory<_i295.ExploreRepository>(
      () => _i295.ExploreRepositoryImpl(gh<_i98.ExploreApiProvider>()));
  return getIt;
}

class _$ExploreApiModule extends _i98.ExploreApiModule {}

class _$HomeApiModule extends _i789.HomeApiModule {}
