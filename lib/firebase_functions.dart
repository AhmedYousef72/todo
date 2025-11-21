import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) {
            return TaskModel.fromJson(snapshot.data()!);
          },
          toFirestore: (task, _) {
            return task.toJson();
          },
        );
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  // static Future<QuerySnapshot<TaskModel>> getTask() {
  //   var collection = getTaskCollection();
  //   return collection.get();
  // }

  /// Another way to get the data instant quickly

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date) {
    var collection = getTaskCollection();
    return collection
        .where(
          'date',
          isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch,
        )
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTaskCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel taskModel) {
    return getTaskCollection().doc(taskModel.id).update(taskModel.toJson());
  }
}
