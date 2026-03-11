import 'package:ateam_software_test/data/models/experience.dart';
import 'package:ateam_software_test/data/models/living_style.dart';
import 'package:ateam_software_test/data/models/trip.dart';
import 'package:ateam_software_test/data/modules/home/provider/home_api_provider.dart';
import 'package:injectable/injectable.dart';

part 'home_repository.impl.dart';

abstract class HomeRepository {
  Future<List<Experience>> getExperiences();

  Future<List<LivingStyle>> getLivingStyles();

  Future<List<Trip>> getTrips();
}
