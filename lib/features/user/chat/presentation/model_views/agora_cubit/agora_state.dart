import '../../../../../../core/models/user_model.dart';

abstract class AgoraState {}

class AgoraInitial extends AgoraState {}

class ReceiverLoading extends AgoraState {}

class ReceiverSuccess extends AgoraState {
  final UserModel receiver;
  ReceiverSuccess({required this.receiver});
}

class ReceiverError extends AgoraState {}

// agora states

class AgoraError extends AgoraState {}

class AgoraSuccess extends AgoraState {}

class AgoraLoading extends AgoraState {}
