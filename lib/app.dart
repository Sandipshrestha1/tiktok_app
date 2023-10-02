// import 'package:flutter/material.dart';

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       restorationScopeId: 'app',
//       theme: ThemeData.dark().copyWith(
// textTheme: ThemeData.dark().textTheme.apply(

//   fontFamily: 'Nunito',
// ),
//         primaryTextTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Nunito'), 
//       scaffoldBackgroundColor: style.Colors.scaffoldDarkBack,

// primaryColorBrightness: Brightness.dark, 
// bottomNavigationBarTheme: BottomNavigationBarThemeData(


//   backgroundColor: Colors.black,
//   selectedItemColor: style.Colors.mainColor,
//   selectedIconTheme: IconThemeData(color: style.Colors.mainColor),
//   unselectedIconTheme: const IconThemeData(color: Colors.white)

// ),



//       ),






//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:tiktok_app/Screens/main_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

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
        primaryTextTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Nunito'), 
        scaffoldBackgroundColor: Colors.black, // Replace with your desired color

splashColor: Colors.black.withOpacity(0.0),
        // Adjust primaryColorBrightness as needed
        //primaryColorBrightness: Brightness.dark, 
        
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black, // Replace with your desired color
          selectedItemColor: Colors.blue, // Replace with your desired color
          selectedIconTheme: IconThemeData(color: Colors.blue), // Replace with your desired color
          unselectedIconTheme: IconThemeData(color: Colors.white), // Replace with your desired color
        ),
      ),
      home: const MainScreen(),
    );
  }
}
