import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../providers/app config provider.dart';
class LanguageBottom extends StatefulWidget {

  @override
  State<LanguageBottom> createState() => _LanguageBottomState();
}

class _LanguageBottomState extends State<LanguageBottom> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: (){
        provider.changeLanguage('en');
          },
          child: provider.appLanguage=='en'?
              getSelected(AppLocalizations.of(context)!.english)
              :getUnSelected(AppLocalizations.of(context)!.english)
        ),
        InkWell(
          onTap: (){
            provider.changeLanguage('ar');
          },
          child:provider.appLanguage=='ar'?
          getSelected(AppLocalizations.of(context)!.arabic)
              :getUnSelected(AppLocalizations.of(context)!.arabic)
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
             color: Theme.of(context).primaryColor
         ),),
         Icon(Icons.check,color: Theme.of(context).primaryColor,size: 30,)
       ],
     ),
   );
  }
  Widget getUnSelected (String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,style:Theme.of(context).textTheme.titleMedium,),
    );
  }
}
