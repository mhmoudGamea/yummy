import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/models/agora_config_model.dart';

class ChatVideoViewBody extends StatefulWidget {
  const ChatVideoViewBody({super.key});

  @override
  State<ChatVideoViewBody> createState() => _ChatVideoViewBodyState();
}

class _ChatVideoViewBodyState extends State<ChatVideoViewBody> {
  // initialize agora video
  int _remoteUid = 0;
  bool _localUserJoined = false;
  late RtcEngine _rtcEngine;

  final AgoraConfigModel _agoraConfigModel = GetIt.instance<AgoraConfigModel>();

  @override
  void initState() {
    super.initState();
    initializeAgora();
  }

  Future<void> initializeAgora() async {
    await [Permission.camera, Permission.microphone].request();
    _rtcEngine = createAgoraRtcEngine();
    await _rtcEngine
        .initialize(RtcEngineContext(appId: _agoraConfigModel.appId));
    await _rtcEngine.enableVideo();
    _rtcEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int uid) {
          setState(() {
            _localUserJoined = true;
          });
          log("local user $uid joined");
        },
        onUserJoined: (RtcConnection connection, int uid, int elapsed) {
          setState(() {
            log('*****remote user joined $uid******');
            _remoteUid = uid;
          });
        },
        onUserOffline:
            (RtcConnection connection, int uid, UserOfflineReasonType reason) {
          setState(() {
            _remoteUid = 0;
            // RtcEngin
          });
        },
      ),
    );

    // await _rtcEngine.startPreview();

    await _rtcEngine.joinChannel(
      token: _agoraConfigModel.token, // استخدم Token إذا كان مطلوبًا
      channelId: _agoraConfigModel.channelId,
      uid: 0, // User ID (0 يعني أن Agora ستولد ID تلقائيًا)
      options: const ChannelMediaOptions(),
    );
  }

  @override
  void dispose() {
    _rtcEngine.leaveChannel();
    _rtcEngine.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_agoraConfigModel.appId);
    print(_agoraConfigModel.channelId);
    print(_agoraConfigModel.token);
    return Stack(
      children: [
        // Remote User Video (Full Screen)
        Center(child: _renderRemoteVideo()),

        // Local User Video (Small Overlay)
        _renderLocalVideo(),
      ],
    );
  }

  Widget _renderRemoteVideo() {
    return Center();
  }

  Widget _renderLocalVideo() {
    return _localUserJoined
        ? Positioned(
            bottom: 20,
            right: 20,
            child: SizedBox(
              width: 100,
              height: 120,
              child: AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: _rtcEngine,
                  canvas: VideoCanvas(uid: 0), // UID 0 for local video
                ),
              ),
            ),
          )
        : CircularProgressIndicator();
  }
}
