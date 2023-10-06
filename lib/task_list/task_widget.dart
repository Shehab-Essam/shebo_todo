import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/firebase_utils.dart';
import 'package:todo_project/providers/list_provider.dart';
import '../home/edit_screen.dart';
import '../model/task.dart';
import '../my_theme.dart';
class TaskWidget extends StatelessWidget {
  Task task ;
  TaskWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: const EdgeInsets.all(12),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topLeft:Radius.circular(15),
                bottomLeft:Radius.circular(15),
              ),
              onPressed: (context){
                FireBaseUtils.deleteTaskFireStore(task).timeout(
                  const Duration(milliseconds: 500),onTimeout: (){
                    listProvider.getAllTasksFromFireStore();
                }
                );
              },
              backgroundColor: MyTheme.redLight,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).primaryColor,
            ),
            child: InkWell(
              onTap: (){Navigator.of(context).pushNamed(HomeScreenTwo.routeName);},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color:MyTheme.whiteLight,
                    height: 80,
                    width: 5,
                  ),
                  Expanded(
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                            task.title??'',
                              style: Theme.of(context).textTheme.titleSmall,
                             ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                task.description??'',
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(color:MyTheme.whiteLight)),
                          ),
                        ])
                  ),
                  Align(
                    alignment:Alignment.center,
                    child: task.isDone==true ?
                        const Text('Done!',style: TextStyle(color:Colors.green,fontSize:24,fontWeight:FontWeight.w700 ),)
                   :
                  InkWell(
                    onTap: ()async{
                      listProvider.markDone(task.id!).timeout(
                        const Duration(milliseconds: 500),onTimeout: (){
                          listProvider.getAllTasksFromFireStore();
                      }
                      );
                      },
                    child: Container(
                      padding:  const EdgeInsets.symmetric(vertical: 7, horizontal: 21),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: MyTheme.whiteLight,
                      ),
                      child: Icon(
                        Icons.check,
                        color:MyTheme.primaryLight,
                        size: 35,
                      ),
                    ),
                  )),
              ]),
             )
        ,)
    )
    );
  }
}