import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app config provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../my_theme.dart';
class ThemeBottom extends StatefulWidget {

  @override
  State<ThemeBottom> createState() => _ThemeBottomState();
}

class _ThemeBottomState extends State<ThemeBottom> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.appTheme==ThemeMode.dark?
            getSelected(AppLocalizations.of(context)!.dark)
                :getUnSelected(AppLocalizations.of(context)!.dark)
        ),
        InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
            },
            child:provider.isDark()?
            getUnSelected(AppLocalizations.of(context)!.light)
                :getSelected(AppLocalizations.of(context)!.light)
        ),
      ],
    );
  }

  Widget getSelected (String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style:Theme.of(context).textTheme.titleMedium!.copyWith(
              color:MyTheme.blackLight
          ),),
          Icon(Icons.check,color:MyTheme.blackLight,size: 30,)
        ],
      ),
    );
  }

  Widget getUnSelected (String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,style:Theme.of(context).textTheme.titleMedium?.copyWith(color: MyTheme.primaryLight),),
    );
  }
}
