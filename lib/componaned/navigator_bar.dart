import 'package:flutter/material.dart';
import 'package:task11/screens/bmi_calculator.dart';
import 'package:task11/screens/profile_view.dart';

import '../screens/calculator.dart';
import '../screens/logIn_view.dart';

class HomeView extends StatefulWidget {
  const HomeView ({super.key});

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {

  List<Widget>widgetPages=[
    Calculate(),
    Calculator(),
    const ProfileView()

  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f0f33),
      bottomNavigationBar:BottomNavigationBar(

        onTap: (index){

          setState(() {
            selectedIndex=index ;
          });



        },
        currentIndex: selectedIndex,
        backgroundColor: Colors.indigo,
        selectedItemColor:  Colors.white,
    selectedIconTheme: const IconThemeData(color: Colors.white),
        selectedLabelStyle: const TextStyle(fontSize: 20),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedIconTheme: const IconThemeData(color: Color(0xFF7ec7da)),
        iconSize: 30,

        items: const [
          BottomNavigationBarItem(label: "BmiCalculate" ,icon: Icon(Icons.calculate_rounded,),),

          BottomNavigationBarItem(label: "Calulator" ,icon: Icon(Icons.calculate,),),
          BottomNavigationBarItem(label: "Profile" ,icon: Icon(Icons.person,),)

        ],

      ) ,
      body: widgetPages.elementAt(selectedIndex),
    );
  }
}

