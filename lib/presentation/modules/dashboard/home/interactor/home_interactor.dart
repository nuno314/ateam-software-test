import 'package:ateam_software_test/data/models/experience.dart';
import 'package:ateam_software_test/data/models/living_style.dart';
import 'package:ateam_software_test/data/models/trip.dart';
import 'package:ateam_software_test/data/modules/home/repository/home_repository.dart';
import 'package:ateam_software_test/di/di.dart';
import 'package:injectable/injectable.dart';

part 'home_interactor.impl.dart';

abstract class HomeInteractor {
  Future<List<Trip>> fetchTrips();
  Future<List<LivingStyle>> fetchLivingStyles();
  Future<List<Experience>> fetchExperiences();
}
