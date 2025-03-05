import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/chat/domain/repos/agora_repo/agora_repo_impl.dart';
import 'package:yummy/features/user/chat/presentation/model_views/agora_cubit/agora_cubit.dart';

import 'widgets/chat_audio_view_body_bloc_builder.dart';

class ChatAudioView extends StatelessWidget {
  static const String rn = '/ChatAudioView';
  const ChatAudioView({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            AgoraCubit(AgoraRepoImpl())..getReceiverData(receiverUid: uid),
        child: SafeArea(child: ChatAudioViewBodyBlocBuilder()),
      ),
    );
  }
}
