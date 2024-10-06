import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondlelafeproject/istpage.dart';
import 'package:secondlelafeproject/secondpage.dart';
import 'package:secondlelafeproject/thirdpage.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage>{
  int myindex=0;
  final List<Widget> pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[myindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,

        currentIndex: myindex,
        onTap: (index){
        setState(() {
          myindex=index;
        });

        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label:'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:'Profile'),
        ],

      ),

    );
  }

}

