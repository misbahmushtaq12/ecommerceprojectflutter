import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfilescreen extends StatelessWidget {
  var nameFromHome;
  MyProfilescreen(this.nameFromHome);
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('My Profile')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome,$nameFromHome',style: TextStyle(fontSize: 34,color: Colors.blue),),
            ElevatedButton(onPressed: (){},
              child: Text('Back'),),
          ],
        ),
      ),
    );

  }
}
