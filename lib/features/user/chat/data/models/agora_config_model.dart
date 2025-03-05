import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class AgoraConfigModel {
  final String appId;
  final String channelId;
  final String token;

  AgoraConfigModel(
      {required this.appId, required this.channelId, required this.token});

  factory AgoraConfigModel.fromJson(Map<String, dynamic> json) {
    return AgoraConfigModel(
      appId: json['app_id'],
      channelId: json['channel_id'],
      token: json['token'],
    );
  }

  static void agoraConfigModelInitialize() async {
    final configFile = await rootBundle.loadString('assets/config/agora.json');
    Map<String, dynamic> configData = await jsonDecode(configFile);
    final configModel = AgoraConfigModel.fromJson(configData);
    GetIt.instance.registerSingleton<AgoraConfigModel>(configModel);
  }
}
