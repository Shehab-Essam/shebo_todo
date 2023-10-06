import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 import 'package:todo_project/home/home_screen.dart';
import 'package:todo_project/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_project/providers/app%20config%20provider.dart';
import 'package:todo_project/providers/list_provider.dart';
import 'home/edit_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ListProvider()),
        ChangeNotifierProvider(create: (context)=>AppConfigProvider())
      ],
      child: MyApp())
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes:{
        HomeScreen.routeName:(context) =>HomeScreen(),
        HomeScreenTwo.routeName:(context) =>HomeScreenTwo(),
      },
      theme:MyTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
    );

  }
}
//// runApp(ChangeNotifierProvider(
//       create:(context)=>ListProvider(),AppConfigProvider(),
//       child: MyApp())