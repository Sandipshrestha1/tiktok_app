import 'package:flutter/material.dart';
//import 'package:feedvideo/style/theme.dart' as style;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      theme: ThemeData.dark().copyWith(
textTheme: ThemeData.dark().textTheme.apply(

  fontFamily: 'Nunito',
),
//primaryTextTheme: ThemeData.dark().apply(fontFamily: 'Nunito'),
        primaryTextTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Nunito'), 




      ),






    );
  }
}