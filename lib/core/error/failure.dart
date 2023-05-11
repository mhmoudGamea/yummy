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
