part of 'home_interactor.dart';

@Injectable(as: HomeInteractor)
class HomeInteractorImpl implements HomeInteractor {
  final HomeRepository _repository = injector.get();
  @override
  Future<List<Experience>> fetchExperiences() {
    return _repository.getExperiences();
  }
  
  @override
  Future<List<LivingStyle>> fetchLivingStyles() {
    return _repository.getLivingStyles();
  }

  @override
  Future<List<Trip>> fetchTrips() {
    return _repository.getTrips();
  }
}