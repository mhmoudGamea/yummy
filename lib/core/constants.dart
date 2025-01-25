import 'package:flutter/material.dart';

ThemeData lightTheme =
    ThemeData(fontFamily: 'ubuntu', scaffoldBackgroundColor: Colors.white);

// this will hold the current uid of authenticated user.
dynamic uid;
dynamic userPhone;

// collections name
const String kUsersCollection = 'users';
const String kCartCollection = 'cart';
const String kOrdersCollection = 'orders';
const String kFaqCollection = 'faq';
const String kUid = 'uid';
const String kPhoneNumber = 'phoneNumber';
const String kLatitude = 'latitude';
const String kLongitude = 'longitude';
const String kAddress = 'address';
const String kAdministrativeArea = 'administrativeArea';
