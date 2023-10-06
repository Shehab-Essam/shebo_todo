import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_project/model/task.dart';

class FireBaseUtils{
  static CollectionReference<Task> getTasksCollection(){
    return FirebaseFirestore.instance.collection(Task.collectionName).
    withConverter<Task>(
      fromFirestore:(snapshot,options)=>Task.fromFireStore(snapshot.data()!),
      toFirestore:(task,options)=>task.toFireStore(),
    );
  }
  
  static Future<void> addTaskToFirebase(Task task){
    var taskCollection = getTasksCollection();
    DocumentReference<Task> taskDocRef =taskCollection.doc();
    task.id = taskDocRef.id;
    return taskDocRef.set(task);
  }

  static Future<void> deleteTaskFireStore(Task task){
  return getTasksCollection().doc(task.id).delete();
  }

  static Future<void> updateTaskFromFireStore(String id , Task task){
   return FireBaseUtils.getTasksCollection().doc(id).update({
     'title':task.title,
     'description':task.description,
     'dateTime':task.dateTime?.millisecondsSinceEpoch,
   });
  }

  static Future<void> markDoneTaskFromFireStore(String id){
     return FireBaseUtils.getTasksCollection().doc(id).update({
      'isDone':true,
    });
  }
}
