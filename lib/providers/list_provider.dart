import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../firebase_utils.dart';
import '../model/task.dart';

class ListProvider extends ChangeNotifier{
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();
  void getAllTasksFromFireStore()async{
    QuerySnapshot<Task> querySnapshot =await FireBaseUtils.getTasksCollection().get();
    taskList = querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();

    taskList = taskList.where((task){
      if(task.dateTime?.day==selectedDate.day&&task.dateTime?.month==selectedDate.month&&task.dateTime?.year==selectedDate.year){
       return true;
      }
      return false;
    }).toList();

    taskList.sort(
        (Task task1 , Task task2){
          return task1.dateTime!.compareTo(task2.dateTime!);
        }
    );

   notifyListeners();
  }

  void setNewSelectDate(DateTime newDate){
    selectedDate=newDate;
    getAllTasksFromFireStore();
   }

  Future<void> updateTask(String id , Task task)async{
    await FireBaseUtils.updateTaskFromFireStore(id,task);
  }

  Future<void> markDone(String id)async{
    await FireBaseUtils.markDoneTaskFromFireStore(id);
  }

}