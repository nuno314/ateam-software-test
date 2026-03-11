import 'package:ateam_software_test/data/models/experience.dart';
import 'package:ateam_software_test/data/models/living_style.dart';
import 'package:ateam_software_test/data/models/trip.dart';
import 'package:ateam_software_test/data/remote/app_api_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'home_api_contract.dart';

part 'home_api_provider.g.dart';

@RestApi()
abstract class HomeApiProvider {
  @factoryMethod
  factory HomeApiProvider(Dio dio, {String baseUrl}) = _HomeApiProvider;

  @GET(HomeApiContract.getTrips)
  Future<List<Trip>> getTrips();

  @GET(HomeApiContract.getLivingStyles)
  Future<List<LivingStyle>> getLivingStyles();

  @GET(HomeApiContract.getExp)
  Future<List<Experience>> getExp();
}

@module
abstract class HomeApiModule {
  HomeApiProvider homeApiProvider(AppApiService client) {
    return HomeApiProvider(client.dio, baseUrl: client.baseUrl);
  }
}
