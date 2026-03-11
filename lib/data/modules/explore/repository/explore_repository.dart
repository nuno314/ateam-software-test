import 'package:ateam_software_test/data/models/experience.dart';
import 'package:ateam_software_test/data/models/living_style.dart';
import 'package:ateam_software_test/data/models/trip.dart';
import 'package:ateam_software_test/data/modules/explore/provider/explore_api_provider.dart';
import 'package:injectable/injectable.dart';

part 'explore_repository.impl.dart';

abstract class ExploreRepository {
  Future<List<Experience>> getExperiences();

  Future<List<LivingStyle>> getLivingStyles();

  Future<List<Trip>> getTrips();
}
