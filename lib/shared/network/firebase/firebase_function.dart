import 'package:app_template/models/firebase_models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseEquation {

  static CollectionReference<UserModel> usersCollection() {
   return FirebaseFirestore.instance.collection(UserModel.COLLECTION_NAME)
        .withConverter(fromFirestore: (snapshot, options) =>
        UserModel.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),);

  }


  void userLogin(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}