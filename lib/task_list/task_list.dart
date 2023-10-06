 import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
 import 'package:todo_project/my_theme.dart';
import 'package:todo_project/task_list/task_widget.dart';
import '../providers/list_provider.dart';
 import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
   @override
  Widget build(BuildContext context) {
   var listProvider = Provider.of<ListProvider>(context);
    if (listProvider.taskList.isEmpty){listProvider.getAllTasksFromFireStore();}
    return Column(
      children: [
        CalendarTimeline(
          initialDate: listProvider.selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            listProvider.setNewSelectDate(date);
          },
          leftMargin: 20,
          monthColor: MyTheme.redLight,
          dayColor: MyTheme.redLight,
          activeDayColor: MyTheme.whiteLight,
          activeBackgroundDayColor: MyTheme.primaryLight,
          dotsColor: MyTheme.whiteLight,
          selectableDayPredicate: (date) => true,
          locale:'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context,index){
                return TaskWidget(task:listProvider.taskList[index],);
              },
              itemCount:listProvider.taskList.length
          ),
        ),
      ],
    );
  }

}
