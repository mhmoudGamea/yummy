import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repos/agora_repo/agora_repo.dart';
import 'agora_state.dart';

class AgoraCubit extends Cubit<AgoraState> {
  AgoraCubit(this._audioRepo) : super(AgoraInitial());

  final AgoraRepo _audioRepo;

  // get receiver data
  Future<void> getReceiverData({required String receiverUid}) async {
    emit(ReceiverLoading());
    final result = await _audioRepo.getReceiverData(receiverUid: receiverUid);
    result.fold((failure) => emit(ReceiverError()), (user) {
      emit(ReceiverSuccess(receiver: user));
    });
  }
}
