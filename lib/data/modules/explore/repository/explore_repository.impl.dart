part of 'explore_repository.dart';

@Injectable(as: ExploreRepository)
class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreApiProvider _apiProvider;

  ExploreRepositoryImpl(this._apiProvider);

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
