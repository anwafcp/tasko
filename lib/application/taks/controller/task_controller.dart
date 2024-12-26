import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_app/application/taks/model/task_model.dart';

class TaskController extends ChangeNotifier {
  final FirebaseFirestore myfrestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> saveData(TaskModel taskdata) async {
    final userId = firebaseAuth.currentUser?.uid;
    if (userId == null) {
      print("no user found");
    }
    try {
      await myfrestore
          .collection("myuser")
          .doc(userId)
          .collection("tasks")
          .add(taskdata.tojson());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Stream<List<TaskModel>> getData() {
    final userId = firebaseAuth.currentUser?.uid;
    if (userId == null) {
      return Stream.empty();
    }
    return myfrestore
        .collection('myuser')
        .doc(userId)
        .collection('tasks')
        .orderBy('time', descending: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => TaskModel.fromJson(doc.data(),docId: doc.id))
            .toList());
  }

  delete(String docId) async {
    final userId = firebaseAuth.currentUser?.uid;
    await myfrestore
        .collection('myuser')
        .doc(userId)
        .collection("tasks")
        .doc(docId)
        .delete();
    notifyListeners();
  }
  Future<void>editData(TaskModel Taskmodel,String docId)async{
    final userId=firebaseAuth.currentUser?.uid;
    try{
      await myfrestore
          .collection('myuser')
          .doc(userId)
          .collection("tasks")
          .doc(docId)
          .update(Taskmodel.tojson());
      notifyListeners();
    }catch(e){
      print(e);
    }
    notifyListeners();
  }
}
