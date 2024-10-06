import 'package:ecommerceapp/BagProvider.dart';
import 'package:ecommerceapp/favouriteprovider.dart';
import 'package:ecommerceapp/login.dart';
import 'package:ecommerceapp/navigationbar.dart';
import 'package:ecommerceapp/sametextstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                    create: (context) => FavouriteProvider()),
                ChangeNotifierProvider(create: (context) => BagProvider()),
              ],
              child: MaterialApp(
                title: '',
                theme: ThemeData(
                    //useMaterial3: true, colorScheme: const ColorScheme(background: Colors.white),
                    ),
                debugShowCheckedModeBanner: false,
                home: const MyHomePage(title: ""),
              ));
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nametxt = TextEditingController();
  var emailtxt = TextEditingController();
  var passtxt = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Text('Sign up', style: SameTextStyle.heading),
                  SizedBox(height: 25),
                  SizedBox(
                    height: 80,
                    child: TextFormField(
                        controller: nametxt,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: 50),
                            label: Text(' Name'),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter valid Name";
                          } else {
                            return null;
                          }
                        }),
                  ),
                  SizedBox(
                    height: 80,
                    child: TextFormField(
                      controller: emailtxt,
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains('@')) {
                          return " Please enter valid email";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 25),
                          label: Text(' Email'),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: TextFormField(
                      controller: passtxt,
                      obscureText: true,
                      obscuringCharacter: '*',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "  please enter valid Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 25),
                          label: Text(' Password'),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Already have an account"),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          icon: Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.red,
                          ))
                    ],
                  ),
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()));
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          //   primary:Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                      child: Text(
                    'Or sign up with social account',
                    style: TextStyle(fontSize: 18),
                  )),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 50,
                          width: 70,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          "assets/images/facebook.png",
                          height: 50,
                          width: 70,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
