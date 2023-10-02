// // import 'package:flutter/material.dart';
// // import 'package:tiktok_app/bloc/bottom_navbar_bloc.dart';

// // class MainScreen extends StatefulWidget {
// //   const MainScreen({super.key});

// //   @override
// //   State<MainScreen> createState() => _MainScreenState();
// // }

// // class _MainScreenState extends State<MainScreen> {
// // final BottomNavBarBloc _bottomNavBarBloc = BottomNavBarBloc();

// // @override 
// // void  initState() {

// //   super.initState();
// // }
// // @override 
// // void dispose() {
// //   super.dispose();
// // }




// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(


// //       body: StreamBuilder<NavBarItem>{
// //         stream: _bottomNavBarBloc.itemStream,
// //         initialData: _bottomNavBarBloc.defaultItem,
// //         builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          
// //         }
// //       }
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:tiktok_app/bloc/bottom_navbar_bloc.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
// final BottomNavBarBloc _bottomNavBarBloc = BottomNavBarBloc();

// @override 
// void  initState() {

//   super.initState();
// }
// @override 
// void dispose() {
//   super.dispose();
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<NavBarItem>(
//         stream: _bottomNavBarBloc.itemStream,
//         initialData: _bottomNavBarBloc.defaultItem,
//         builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {

//             switch (snapshot.data) {
//               case NavBarItem.home:
//                 return Container(); // Replace with your home page content
              
//               case NavBarItem.favorite:
//                 return Container();
             
//               case NavBarItem.plus:
//                 return Container();
//               case NavBarItem.search:
//                return Container();
//               case NavBarItem.profile:
//                return Container();

//                default: return Container();
              
//             }
//           }),
//           bottomNavigationBar: StreamBuilder(  
//             stream: _bottomNavBarBloc.itemStream,
//             initialData: _bottomNavBarBloc.defaultItem,
//             builder: (BuildContext context , AsyncSnapshot<NavBarItem> snapshot) {

// return Container(  
//   decoration: BoxDecoration( border: Border(top: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.4)))),
// child: BottomNavigationBar(
//   elevation: 0.9,
//   iconSize: 21,
//   unselectedFontSize: 10.0,
//   selectedFontSize: 10.0,
//   type: BottomNavigationBar.fixed,
//   currentIndex: snapshot.data!.index,
//   onTap: _bottomNavBarBloc.pickItem,
//   items: const [BottomNavigationBarItem(
//     label: "Home", 
//     icon: Icon(Icons.home,
    
//     color: Colors.white,
//     height: 25.0,
//     width: 25.0,
//     ),
 
 
//      ),],
// ),


// );



//             },



//           ),
//           );
//         }
    
  
//   }


import 'package:flutter/material.dart';
import 'package:tiktok_app/bloc/bottom_navbar_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
final BottomNavBarBloc _bottomNavBarBloc = BottomNavBarBloc();

@override 
void  initState() {

  super.initState();
}
@override 
void dispose() {
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<NavBarItem>(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          Widget selectedPage;

          switch (snapshot.data) {
            case NavBarItem.home:
              selectedPage = HomePage(); // Replace with your home page content
              break;
            case NavBarItem.favorite:
              selectedPage = FavoritePage();
              break;
            case NavBarItem.plus:
              selectedPage = PlusPage();
              break;
            case NavBarItem.search:
              selectedPage = SearchPage();
              break;
            case NavBarItem.profile:
              selectedPage = ProfilePage();
              break;
            default:
              selectedPage = Container();
          }

          return selectedPage;
        },
      ),
      bottomNavigationBar: StreamBuilder<NavBarItem>(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.4)),
              ),
            ),
            child: BottomNavigationBar(
              elevation: 0.9,
              iconSize: 21,
              unselectedFontSize: 10.0,
              selectedFontSize: 10.0,
              type: BottomNavigationBarType.fixed,
              currentIndex: snapshot.data!.index,
              onTap: _bottomNavBarBloc.pickItem,
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    // height: 25.0,
                   //  width: 25.0,
                  ),
                ),
                // Add more BottomNavigationBarItems for other navigation items
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Home Page"), // Replace with your home page content
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Favorite Page"), // Replace with your favorite page content
      ),
    );
  }
}

class PlusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Plus Page"), // Replace with your plus page content
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Search Page"), // Replace with your search page content
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Profile Page"), // Replace with your profile page content
      ),
    );
  }
}
