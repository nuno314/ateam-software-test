part of 'chat_bloc.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatItem> items;
  ChatLoaded(this.items);
}

class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}
