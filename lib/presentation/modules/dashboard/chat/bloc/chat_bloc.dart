import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../chat_interactor.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatInteractor _interactor;

  ChatBloc(this._interactor) : super(ChatInitial()) {
    on<ChatLoadEvent>(_onLoad);
    add(ChatLoadEvent());
  }

  Future<void> _onLoad(ChatLoadEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      await _interactor.loadData();
      emit(ChatLoaded());
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
