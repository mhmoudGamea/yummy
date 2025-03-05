import 'package:flutter/material.dart';
import 'widgets/chat_video_view_body.dart';

class ChatVideoView extends StatelessWidget {
  static const rn = '/chat_video_view';
  const ChatVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatVideoViewBody();
  }
}
