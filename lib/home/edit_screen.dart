import 'package:flutter/material.dart';
import 'package:todo_project/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenTwo extends StatefulWidget {const HomeScreenTwo({super.key});
 static const String routeName ='Home-Two';

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:Text(AppLocalizations.of(context)!.app_title,style:TextStyle(color:MyTheme.whiteLight),),
        backgroundColor:MyTheme.primaryLight,),
      body: Container(
        color:MyTheme.whiteLight,
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
             Text(AppLocalizations.of(context)!.edit_button,
              style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: 15,),
            Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
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
                        validator: (text){
                          if(text==null||text.isEmpty){
                            return 'please enter task description';
                          }
                          return null;
                        },
                        decoration:InputDecoration(
                            hintText: AppLocalizations.of(context)!.select_description
                        ),
                        maxLines: 4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(AppLocalizations.of(context)!.select_date,style: Theme.of(context).textTheme.titleSmall,),
                    ),
                    InkWell(
                      onTap:(){showCalendar();
                        setState(() {});},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                          ,style: Theme.of(context).textTheme.titleSmall,textAlign:TextAlign.center,),
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: (){addtask();},
                          child:Text(AppLocalizations.of(context)!.save_button,style: Theme.of(context).textTheme.titleLarge,)
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
  Future<void> showCalendar() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if(chooseDate!=null){selectedDate=chooseDate;}
    setState(() {});
  }

  void addtask() {
    if(formKey.currentState!.validate()==true){}
  }
}
