import 'package:ateam_software_test/data/models/experience.dart';
import 'package:ateam_software_test/data/models/living_style.dart';
import 'package:ateam_software_test/data/models/trip.dart';
import 'package:ateam_software_test/data/remote/app_api_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'explore_api_contract.dart';

part 'explore_api_provider.g.dart';

@RestApi()
abstract class ExploreApiProvider {
  @factoryMethod
  factory ExploreApiProvider(Dio dio, {String baseUrl}) = _ExploreApiProvider;

  @GET(ExploreApiContract.getTrips)
  Future<List<Trip>> getTrips();

  @GET(ExploreApiContract.getLivingStyles)
  Future<List<LivingStyle>> getLivingStyles();

  @GET(ExploreApiContract.getExp)
  Future<List<Experience>> getExp();
}

@module
abstract class ExploreApiModule {
  ExploreApiProvider exploreApiProvider(AppApiService client) {
    return ExploreApiProvider(client.dio, baseUrl: client.baseUrl);
  }
}
