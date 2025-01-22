import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummy/features/user/payment/data/models/paymob_model/paymob_config_model.dart';

import 'firestore_services.dart';

GetIt _getIt = GetIt.I; // == GetIt.instance

class ServiceLocator {
  static Future<void> setUp() async {
    _getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
    _getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
    _getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
    _getIt.registerSingleton<FirestoreServices>(FirestoreServices());
    _getIt.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance());
    _getIt.registerSingleton<ImagePicker>(ImagePicker());

    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = json.decode(configFile);

    _getIt.registerSingleton<PaymobConfigModel>(
      PaymobConfigModel(
          apiKey: configData['api_key'],
          baseUrl: configData['base_url'],
          authenticationRequest: configData['authentication_request'],
          orderRegistration: configData['order-registration'],
          paymentRequest: configData['payment_request'],
          integrationOnlineCard: configData['integration_online_card']),
    );
    json.encode(configData);
  }
}
