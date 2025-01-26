import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/error/failure.dart';

class UserService {
  // get user data for profile and drawer
  static final CollectionReference _coll =
      GetIt.instance<FirebaseFirestore>().collection(kUsersCollection);
  static final String _uid = GetIt.instance<FirebaseAuth>().currentUser!.uid;
  Future<Map<String, dynamic>> getUserProfileData() async {
    try {
      final result = await _coll.doc(_uid).get();
      if (result.data() == null) {
        throw FireStoreSideError('Can\'t find user data');
      } else {
        return result.data() as Map<String, dynamic>;
      }
    } catch (error) {
      throw FireStoreSideError(error.toString());
    }
  }
}
