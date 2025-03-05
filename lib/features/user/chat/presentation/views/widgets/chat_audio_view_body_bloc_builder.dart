import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/chat/presentation/model_views/agora_cubit/agora_cubit.dart';

import '../../model_views/agora_cubit/agora_state.dart';
import 'chat_audio_view_body.dart';

class ChatAudioViewBodyBlocBuilder extends StatelessWidget {
  const ChatAudioViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgoraCubit, AgoraState>(
      builder: (context, state) {
        if (state is ReceiverLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is ReceiverSuccess) {
          return ChatAudioViewBody(userModel: state.receiver);
        }
        return const Center(child: Text('Something went wrong'));
      },
    );
  }
}
