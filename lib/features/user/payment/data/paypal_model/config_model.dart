import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class ConfigModel {
  final String clientId;
  final String secretKey;

  ConfigModel({required this.clientId, required this.secretKey});

  factory ConfigModel.fromMap(Map<String, dynamic> map) =>
      ConfigModel(clientId: map['client_id'], secretKey: map['secret_key']);

  static Future<void> init() async {
    final configFile = await rootBundle.loadString('assets/config/paypal.json');
    Map<String, dynamic> configData = await jsonDecode(configFile);
    final configModel = ConfigModel.fromMap(configData);
    GetIt.instance.registerSingleton<ConfigModel>(configModel);
  }
}
