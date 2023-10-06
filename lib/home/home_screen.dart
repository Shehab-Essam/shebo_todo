import 'package:flutter/material.dart';
import 'package:todo_project/my_theme.dart';
import 'package:todo_project/settings/settings.dart';
import 'package:todo_project/task_list/task_list.dart';
import '../task_list/bottom sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex= 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(AppLocalizations.of(context)!.app_title,style:Theme.of(context).textTheme.titleLarge,),
      ),
      bottomNavigationBar:BottomAppBar(
        color:Theme.of(context).primaryColor,
        shape:CircularNotchedRectangle(),
        notchMargin:8,
        child: BottomNavigationBar(
          currentIndex:selectedIndex,
          onTap: (index){
            selectedIndex=index;
            setState(() {});},
            items:[
          BottomNavigationBarItem(icon:const Icon(Icons.list),label:AppLocalizations.of(context)!.task_list),
          BottomNavigationBarItem(icon:const Icon(Icons.settings),label:AppLocalizations.of(context)!.settings),
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            color:MyTheme.whiteLight,
            width:6,
          )
        ),
        onPressed:(){showAddTaskBottomSheet();},
        child:const Icon(Icons.add,size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }
  List<Widget> tabs = [TaskListTab(),SettingsTab()];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context)=>AddTaskBottomSheet(),
    );
  }
}
