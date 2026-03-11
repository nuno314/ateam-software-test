import 'package:ateam_software_test/data/models/experience.dart';
import 'package:ateam_software_test/data/models/living_style.dart';
import 'package:ateam_software_test/data/models/trip.dart';
import 'package:ateam_software_test/data/modules/explore/repository/explore_repository.dart';
import 'package:ateam_software_test/di/di.dart';
import 'package:injectable/injectable.dart';

abstract class ExploreInteractor {
  Future<List<Trip>> getTrips();
  Future<List<LivingStyle>> getLivingStyles();
  Future<List<Experience>> getExperiences();
}

@Injectable(as: ExploreInteractor)
class ExploreInteractorImpl implements ExploreInteractor {
  ExploreInteractorImpl();
  final ExploreRepository _repository = injector.get();

  @override
  Future<List<Trip>> getTrips() async {
    return _repository.getTrips();
  }

  @override
  Future<List<LivingStyle>> getLivingStyles() async {
    return _repository.getLivingStyles();
  }

  @override
  Future<List<Experience>> getExperiences() async {
    return _repository.getExperiences();
  }
}
