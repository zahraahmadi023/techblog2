import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tecgblog2_prac/component/myColors.dart';
import 'package:tecgblog2_prac/view/mainScreen.dart';
import 'package:tecgblog2_prac/view/register_into.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      //////////////////////////////////////////////////////////////////////
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('fa'), //farsi
      ],
      //////////////////////////////////////////////////////////////////////////////ltr
      theme: ThemeData(

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2),),
          filled: true,
        ),



        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return textTheme.headline1;
            }
            return textTheme.subtitle1;
          }), backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return SolidColors.seeMore;
            }
            return SolidColors.primaryColor;
          })),
        ),

        fontFamily: 'DANA',
        // ignore: prefer_const_constructors
        textTheme: TextTheme(
          // ignore: prefer_const_constructors
          headline1: TextStyle(
              fontFamily: 'DANA',
              fontSize:16,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle),
          subtitle1: const TextStyle(
              fontFamily: 'DANA',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: SolidColors.posterSubTitle),
          // ignore: prefer_const_constructors
          bodyText1: TextStyle(
            fontFamily: 'DANA',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w300,

            // ignore: prefer_const_constructors
          ),
          headline2: const TextStyle(
            fontFamily: 'DANA ',
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          headline3: const TextStyle(
              fontFamily: 'DANA ',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SolidColors.seeMore),
          headline4: const TextStyle(
            fontFamily: 'DANA ',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
            headline5: const TextStyle(
            fontFamily: 'DANA ',
            fontSize: 14,
            color: Color.fromARGB(255, 131, 125, 125),
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,

      home: MainScreen(),
    );
  }
}
