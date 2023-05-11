import 'package:flutter/material.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

class RegisterLoading extends LoginState {}

class RegisterSuccess extends LoginState {}

class RegisterFailure extends LoginState {}
