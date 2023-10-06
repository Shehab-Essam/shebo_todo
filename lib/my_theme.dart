import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = const Color(0xff5D9CEC);
  static Color primaryDark = const Color(0x0ff060e1);
  static Color backgroundLight =  const Color(0xffDFECDB);
  static Color backgroundDark =  const Color(0xff1E1E1E);
  static Color greenLight =  const Color(0xff61E757);
  static Color whiteLight =  const Color(0xffFFFFFF);
  static Color blackLight =  const Color(0xff383838);
  static Color redLight =  const Color(0xffEC4B4B);
  static Color greyLight =  const Color(0xffC8C9CB);
  static Color darkBlack =  const Color(0xff141922);
  static ThemeData lightTheme = ThemeData(
      primaryColor:primaryLight,
      scaffoldBackgroundColor: backgroundLight,
      textTheme: TextTheme(
          titleLarge:TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 23,
            color: whiteLight,
          ),
          titleMedium:TextStyle(
            fontWeight:FontWeight.bold,
            fontSize:21,
            color: blackLight,
          ),
          titleSmall:TextStyle(
            fontWeight:FontWeight.bold,
            fontSize:19,
            color: blackLight,
          )
      ),
      appBarTheme:AppBarTheme(backgroundColor: primaryLight),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: whiteLight,
        unselectedItemColor: blackLight,
        backgroundColor:Colors.transparent,
        elevation: 0,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(15),
                topRight:Radius.circular(15),
              )
          )
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryLight)
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor:primaryDark,
      scaffoldBackgroundColor: backgroundDark,
      textTheme: TextTheme(
          titleLarge:TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 23,
            color: blackLight,
          ),
          titleMedium:TextStyle(
            fontWeight:FontWeight.bold,
            fontSize:21,
            color: blackLight,
          ),
          titleSmall:TextStyle(
            fontWeight:FontWeight.bold,
            fontSize:19,
            color: primaryLight,
          )
      ),
      appBarTheme:AppBarTheme(backgroundColor: primaryLight),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryLight,
        unselectedItemColor: redLight,
        backgroundColor:Colors.transparent,
        elevation: 0,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(15),
                topRight:Radius.circular(15),
              )
          )
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryLight)
  );
}



