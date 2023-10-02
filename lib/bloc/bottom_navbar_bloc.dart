// class BottomNavBarBloc {
//   enum NavBar {home, favorite, plus, search, profile}

// class BottomNavBarBloc {
//   final StreamController<NavBarItem>_navBarController =
//   StreamController<NavBarItem>.broadcast();
// NavBarItem defaultItem = NavBarItem.home;
// Stream<NavBarItem> get itemStream => _navBarController.stream;

// void pickItem(int i) {

//   switch (i) {
//     case 0:

//     _navBarController.sink.add(NavBarItem.home);
//   }

//   case 1:
//   _navBarController.sink.add(NavBarItem.favourite);

//   case 2:
//   _navBarController.sink.add(NavBarItem.plus);
//  }
// }

// }

import 'dart:async';

enum NavBarItem { home, favorite, plus, search, profile }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.home;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.home);
        break; // Add a break statement here

      case 1:
        _navBarController.sink.add(NavBarItem.favorite);
        break; // Add a break statement here

      case 2:
        _navBarController.sink.add(NavBarItem.plus);
        break; // Add a break statement here

      case 3:
        _navBarController.sink.add(NavBarItem.search);
        break;

      case 4:
        _navBarController.sink.add(NavBarItem.profile);
        break;
    }
  }

  // void dispose() {
  //   _navBarController.close();
  // }

  close() {
    _navBarController.close();
  }
}
