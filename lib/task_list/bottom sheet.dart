import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/firebase_utils.dart';
import 'package:todo_project/model/task.dart';
import 'package:todo_project/providers/list_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  late ListProvider listProvider ;
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
    return Container(
     padding: const EdgeInsets.all(12),
      child:Column(
        children: [
          Text(AppLocalizations.of(context)!.add_new_task,
          style: Theme.of(context).textTheme.titleMedium,),
          Form(
              key: formKey,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text){title=text;},
                  validator: (text){
                    if(text==null||text.isEmpty){
                      return 'please enter task title';
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                    hintText: AppLocalizations.of(context)!.select_title
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text){description=text;},
                  validator: (text){
                    if(text==null||text.isEmpty){
                      return 'please enter task description';
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                      hintText:AppLocalizations.of(context)!.select_description
                  ),
                  maxLines: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!.select_date,style: Theme.of(context).textTheme.titleSmall,),
              ),
              InkWell(
                onTap:(){showCalendar();},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                    ,style: Theme.of(context).textTheme.titleSmall,textAlign:TextAlign.center,),
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    addtask();
                  },
                  child:Text(AppLocalizations.of(context)!.add_button,style: Theme.of(context).textTheme.titleLarge,)
              )
            ],
          ))
        ],
      ),
    );
  }

  Future<void> showCalendar() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if(chooseDate!=null){selectedDate=chooseDate;}
    setState(() {});
  }

  void addtask() {
    if(formKey.currentState!.validate()==true){
      Task task = Task(title: title, description: description, dateTime: selectedDate);
      FireBaseUtils.addTaskToFirebase(task).timeout(
        const Duration(milliseconds: 500),onTimeout: (){
          listProvider.getAllTasksFromFireStore();
          Navigator.pop(context);
      },
      );
    }
  }
}
