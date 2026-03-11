import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../chat_interactor.dart';
import 'chat_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatInteractor _interactor;

  ChatBloc(this._interactor) : super(ChatInitial()) {
    on<ChatLoadEvent>(_onLoad);
    add(ChatLoadEvent());
  }

  // sample data moved into bloc
  List<ChatItem> _sampleItems() => [
    ChatItem(
      name: 'Kari Rasmussen',
      message: 'Thanks for contacting me!',
      time: DateTime.now().subtract(Duration(minutes: 37)),
      avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
      unreadCount: 2,
      status: MessageStatus.seen,
    ),
    ChatItem(
      name: 'Anita Cruz',
      message: 'Your payment was accepted.',
      time: DateTime.now().subtract(Duration(hours: 20)),
      avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
      status: MessageStatus.sent,
    ),
    ChatItem(
      name: 'Noah Pierre',
      message: 'It was great experience!',
      time: DateTime(2021, 10, 11),
      avatarUrl: 'https://randomuser.me/api/portraits/men/76.jpg',
    ),
    ChatItem(
      name: 'Lucy Bond',
      message: 'How much does it cost?',
      time: DateTime(2021, 10, 11),
      avatarUrl: 'https://randomuser.me/api/portraits/women/20.jpg',
    ),
    ChatItem(
      name: 'Louise Vuitton',
      message: 'Sure, man!',
      time: DateTime(2021, 10, 11),
      avatarUrl: 'https://randomuser.me/api/portraits/men/21.jpg',
    ),
  ];

  Future<void> _onLoad(ChatLoadEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      await _interactor.loadData();
      // after loading, provide sample items (replace with real data later)
      emit(ChatLoaded(_sampleItems()));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
