import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/application/authatication/model/user_model.dart';

class AuthCountroller extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore dbs = FirebaseFirestore.instance;
  // bool? success;

  String userId = "";
// sign up
  Future<void> signUp({
      required String email,
    required String password,
    required String firstName,
    required String secondName,
    required String phoneNumber,
  }) async {
    //  set preference
    final preference = await SharedPreferences.getInstance();
    try {
      final userCreds = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      userId = userCreds.user!.uid;
      UserModel userModel = UserModel(
          id: userId,
          email: email,
          firstName: firstName,
          secondName: secondName,
          phoneNumber: phoneNumber);
      await dbs.collection("myuser").doc(userId).set(userModel.toJson());

      preference.setString("userId", userId);
      print("user created with user $userId");
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

// sign in
  Future<void> SignIn(String email, String password) async {
    final preference = await SharedPreferences.getInstance();

    try {
      final userCreds = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      userId = userCreds.user!.uid;
      preference.setString("userId", userId);

      print("user login  with userid $userId");

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

// sign out
  Future<void> signOut() async {
    final preference = await SharedPreferences.getInstance();
    preference.remove("userId");
    notifyListeners();
  }
}
