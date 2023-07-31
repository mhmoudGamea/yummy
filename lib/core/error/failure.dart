import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class FireStoreSideError extends Failure {
  const FireStoreSideError(super.errorMessage);

  factory FireStoreSideError.fromCredential(String code) {
    if (code == 'invalid-credential') {
      return const FireStoreSideError('invalid-credential');
    } else if (code == 'operation-not-allowed') {
      return const FireStoreSideError(
          'The account corresponding to the credential is not enabled');
    } else if (code == 'user-disabled') {
      return const FireStoreSideError(
          'Thrown if the user corresponding to the given credential has been disabled');
    } else if (code == 'invalid-verification-code') {
      return const FireStoreSideError(
          'the verification code of the credential is not valid');
    } else if (code == 'invalid-verification-id') {
      return const FireStoreSideError(
          'the verification ID of the credential is not valid.id.');
    } else {
      return const FireStoreSideError(
          '"Credential" there was an error please try later.');
    }
  }

  factory FireStoreSideError.fromFailed(String code) {
    if (code == 'invalid-phone-number') {
      return const FireStoreSideError(
          'The provided phone number is not valid.');
    }
    return const FireStoreSideError(
        '"Failed" there was an error please try later.');
  }
}

class LocationSideError extends Failure {
  const LocationSideError(super.errorMessage);

  factory LocationSideError.fromDeviceLocation(String error) {
    return LocationSideError(error);
  }
}

// admin login and register errors

class FirebaseSideError extends Failure {
  FirebaseSideError(super.errorMessage);

  factory FirebaseSideError.fromLogin(String code) {
    if (code == 'user-not-found') {
      return FirebaseSideError('No user found for that email.');
    } else if (code == 'wrong-password') {
      return FirebaseSideError('Wrong password provided for that user.');
    } else {
      return FirebaseSideError('Opps, unknown error happen.');
    }
  }
  factory FirebaseSideError.fromSignin(String code) {
    if (code == 'weak-password') {
      return FirebaseSideError('The password provided is too weak.');
    } else if (code == 'email-already-in-use') {
      return FirebaseSideError('The account already exists for that email.');
    } else {
      return FirebaseSideError('Opps, unknown error happen.');
    }
  }
}

// errors from storage
class StorageSideError extends Failure {
  StorageSideError(super.errorMessage);

  factory StorageSideError.fromStore(String error) {
    return StorageSideError(error);
  }
}

// paymob api errors

class ServerSideError extends Failure {
  ServerSideError(super.errorMessage);

  factory ServerSideError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerSideError('Connection timed out, Please try again later');
      case DioExceptionType.sendTimeout:
        return ServerSideError('Send timed out, Please try again later');
      case DioExceptionType.receiveTimeout:
        return ServerSideError('Receive timed out, Please try again later');
      case DioExceptionType.badResponse:
        return ServerSideError.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerSideError('Request to api was canceled.');
      default:
        return ServerSideError(
            'Opps there was an error, Please try again later.');
    }
  }

  factory ServerSideError.fromResponse(
      int statusCode, Map<String, dynamic> json) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerSideError(json['error']['message']);
    } else if (statusCode == 404) {
      return ServerSideError('This page is not found, Please try later.');
    } else if (statusCode == 500) {
      return ServerSideError('Internal server error, Please try later.');
    } else {
      return ServerSideError(
          'Opps there was an error, Please try again later.');
    }
  }
}
