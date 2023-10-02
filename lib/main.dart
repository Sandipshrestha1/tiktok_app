import 'package:flutter/material.dart';
import 'package:tiktok_app/app.dart';

void main() {
  runApp(const MyApps());

}
class MyApps extends StatelessWidget {
  const MyApps ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}