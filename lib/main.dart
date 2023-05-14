import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/models/change.dart';
import 'package:simple_todo_app/themeModel.dart';
import 'package:simple_todo_app/ui/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers:[
      ChangeNotifierProvider(
        create: (_)=>ThemeModal(),
      ),

      ChangeNotifierProvider(
        create: (_)=>TaskProvider(),
      )
    ]

 ,
      child: Consumer(
        builder: (context, ThemeModal themeModal, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Simple Tasks Demo',
            darkTheme: DarkTheme,

            theme: themeModal.isDark?DarkTheme:LightTheme,

            home: HomePage(),
            routes: {
              'home': (context) => HomePage(),
            },
          );
        },
      ),
    );


  }
}

final LightTheme =ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.indigo,
  accentColor: Colors.amber,
  fontFamily: 'ElMessiri',
  textTheme: ThemeData.light().textTheme.copyWith(
    headline5: TextStyle(
      color: Colors.blue,
      fontSize: 24,
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.red,
      fontSize: 16,
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.bold,
    ),
  ),
);

final DarkTheme =ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.indigo,
  accentColor: Colors.amber,
  brightness: Brightness.dark,
  fontFamily: 'ElMessiri',
  textTheme: ThemeData.dark().textTheme.copyWith(
    headline5: TextStyle(
      color: Colors.blue,
      fontSize: 24,
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.red,
      fontSize: 16,
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.bold,
    ),
  ),
);