import 'package:flutter/material.dart';

ThemeData lightTheme =
    ThemeData(fontFamily: 'ubuntu', scaffoldBackgroundColor: Colors.white);

// this will hold the current uid of authenticated user.
dynamic uid;
dynamic userPhone;

// collections name
const String kUsersCollection = 'users';
const String kUid = 'uid';
const String kPhoneNumber = 'phoneNumber';
