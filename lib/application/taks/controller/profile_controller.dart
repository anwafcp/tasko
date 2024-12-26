import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_app/application/authatication/model/user_model.dart';

class ProfileController extends ChangeNotifier {
  final FirebaseFirestore myfrestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<UserModel> userGetData() {
    final userId = firebaseAuth.currentUser?.uid;

    return myfrestore
        .collection("myuser")
        .doc(userId)
        .snapshots()
        .map((snap) => UserModel.fromJson(snap.data() ?? {}));
  }
}
