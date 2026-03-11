import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../saved_interactor.dart';

part 'saved_event.dart';
part 'saved_state.dart';

@injectable
class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedInteractor _interactor;

  SavedBloc(this._interactor) : super(SavedInitial()) {
    on<SavedLoadEvent>(_onLoad);
    add(SavedLoadEvent());
  }

  Future<void> _onLoad(SavedLoadEvent event, Emitter<SavedState> emit) async {
    emit(SavedLoading());
    try {
      await _interactor.loadData();
      emit(SavedLoaded());
    } catch (e) {
      emit(SavedError(e.toString()));
    }
  }
}
