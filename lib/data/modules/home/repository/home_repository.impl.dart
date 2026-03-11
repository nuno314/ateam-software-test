part of 'home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeApiProvider _apiProvider;

  HomeRepositoryImpl(this._apiProvider);

  @override
  Future<List<Experience>> getExperiences() async {
    return _apiProvider.getExp();
  }

  @override
  Future<List<LivingStyle>> getLivingStyles() async {
    return _apiProvider.getLivingStyles();
  }

  @override
  Future<List<Trip>> getTrips() async {
    return _apiProvider.getTrips();
  }
}
