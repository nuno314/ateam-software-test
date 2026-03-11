part of 'explore_bloc.dart';

abstract class ExploreState {
  const ExploreState();
}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<Trip> trips;
  final List<LivingStyle> livingStyles;
  final List<Experience> experiences;

  const ExploreLoaded({
    required this.trips,
    required this.livingStyles,
    required this.experiences,
  });
}

class ExploreError extends ExploreState {
  final String message;
  const ExploreError(this.message);
}
