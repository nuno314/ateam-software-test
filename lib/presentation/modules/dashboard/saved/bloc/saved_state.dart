part of 'saved_bloc.dart';

abstract class SavedState {}

class SavedInitial extends SavedState {}

class SavedLoading extends SavedState {}

class SavedLoaded extends SavedState {}

class SavedError extends SavedState {
  final String message;
  SavedError(this.message);
}
