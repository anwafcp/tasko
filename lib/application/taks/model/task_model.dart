import 'package:cloud_firestore/cloud_firestore.dart';

  class TaskModel {
    final String tilte;
    final String decs;
    final DateTime? time;
     String? docmentId;
      TaskModel({this.docmentId,required this.decs, required this.tilte, this.time});
    factory TaskModel.fromJson(Map<String, dynamic> json,{String? docId }) {
     return TaskModel(docmentId: docId,
        decs: json['desc'] ?? "",
        tilte: json['tilte'] ?? "",
        time: (json["time"] as Timestamp).toDate()
     );
  }
  Map <String,dynamic> tojson(){
      return {
        'tilte':tilte,
        'desc':decs,
        'time':time ?? FieldValue.serverTimestamp(),
      };
  }
}
