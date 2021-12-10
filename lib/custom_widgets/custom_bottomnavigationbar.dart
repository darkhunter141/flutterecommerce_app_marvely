import 'package:flutter/material.dart';
import 'package:marvelyprojects/files_dart/homepage/homepage.dart';
import 'package:marvelyprojects/files_dart/profile/profiles.dart';

class custom_bottomnavigationbar extends StatefulWidget {
  @override
  _custom_bottomnavigationbarState createState() =>
      _custom_bottomnavigationbarState();
}

class _custom_bottomnavigationbarState
    extends State<custom_bottomnavigationbar> {
  int index_position = 0;
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return BottomNavigationBar(
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        selectedFontSize: hei/50,
        iconSize: hei / 22,
        unselectedFontSize: hei / 50,
        currentIndex: index_position,
        backgroundColor: Color(0xFF505050),
        onTap: (int index) {
          setState(() {
            index_position = index;
            switch (index_position){
              case 0:{Navigator.push(context,MaterialPageRoute(builder: (context)=>homepage_app()));}
              break;
              case 1:{Navigator.push(context,MaterialPageRoute(builder: (context)=>homepage_app()));}
              break;
              case 2:{Navigator.push(context,MaterialPageRoute(builder: (context)=>homepage_app()));}
              break;
              case 3:{Navigator.push(context,MaterialPageRoute(builder: (context)=>profile()));}
              break;
            }
          });
        },
        selectedLabelStyle: TextStyle(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.white),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Colors.white),
              label: "Profile"),
        ]);
  }
}
