import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      designSize: const Size(375,812),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 106.h),
                Text('Login',style:TextStyle(fontSize: 34.sp,
                    fontWeight: FontWeight.bold)),
                SizedBox(height: 100.h),
                SizedBox(height: 80.h,
                  child: TextFormField(
                    validator: (value){
                      if(value==null||value.trim().isEmpty||!value.contains('@')){
                        return "Please enter valid Email";
                      }
                      else{return null;}
                    },
                    decoration: InputDecoration(
                      contentPadding:EdgeInsets.symmetric(vertical: 25.h),
                      border: OutlineInputBorder(),
                      label: Text(' Email'),
                    ),
                  ),
                ),
                SizedBox(height: 80.h,
                  child: TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (value){
                      if(value==null){return "Please enter valid Password";}
                      else{return null;}
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:EdgeInsets.symmetric(vertical: 25.h),

                      label: Text(' Password'),

                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot your Password'),
                    IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward_outlined,color: Colors.red,))

                  ],
                ),
                SizedBox(height: 180.h,),
                SizedBox(width: 343.w,height: 51.h,
                  child: ElevatedButton(onPressed: (){
                    if(formkey.currentState!.validate()){
                    }
                  },
                    child: Text('LOGIN',style: TextStyle(color: Colors.white),),
                    style:ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ) ,),
                ),
                SizedBox(height:124.h),
                Container(height: 20.h,width: 187.w,
                    child: Center(child: Text('Or sign up with social account',style: TextStyle(fontSize: 14.sp),))),
              ],
            ),
          ),
        ),

      )
    );
  }
}
