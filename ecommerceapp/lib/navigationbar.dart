import 'package:ecommerceapp/bag.dart';
import 'package:ecommerceapp/fashionsale.dart';
import 'package:ecommerceapp/favourites.dart';
import 'package:ecommerceapp/profile.dart';
import 'package:ecommerceapp/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int myindex=0;
   List pages=[
    FashionSale(),
    Shop(),
    Bag(),
    Favourites(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
  return
      Scaffold(
        body: pages[myindex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          backgroundColor: Colors.cyan,
          onTap: (index){
            setState(() {
              myindex=index;
            });
          },
          currentIndex: myindex,
          items: const[
            BottomNavigationBarItem(icon:Icon(Icons.home),
              label: 'Home',),
            BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_sharp),
              label: 'Shop',),
            BottomNavigationBarItem(icon:FaIcon(FontAwesomeIcons.bagShopping),
              label: 'Bag',),
            BottomNavigationBarItem(icon:Icon(Icons.favorite),
              label: 'Favorites',),
            BottomNavigationBarItem(icon:Icon(Icons.person),
              label: 'Profile',),

          ],


        ),
      );
  }}
