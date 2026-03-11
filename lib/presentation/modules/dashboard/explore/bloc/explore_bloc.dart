import 'dart:async';

import 'package:ateam_software_test/data/models/experience.dart';
import 'package:ateam_software_test/data/models/living_style.dart';
import 'package:ateam_software_test/data/models/trip.dart';
import 'package:ateam_software_test/presentation/modules/dashboard/explore/interactor/explore_interactor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'explore_event.dart';
part 'explore_state.dart';

@injectable
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreInteractor _interactor;

  ExploreBloc(this._interactor) : super(ExploreInitial()) {
    on<ExploreLoadEvent>(_onLoad);
    add(ExploreLoadEvent());
  }

  Future<void> _onLoad(
    ExploreLoadEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(ExploreLoading());
    try {
      final trips = await _interactor.getTrips();
      final livingStyles = await _interactor.getLivingStyles();
      final experiences = await _interactor.getExperiences();

      emit(
        ExploreLoaded(
          trips: trips,
          livingStyles: livingStyles,
          experiences: experiences,
        ),
      );
    } catch (e) {
      emit(ExploreError(e.toString()));
    }
  }
}
