import 'package:ecommerceapp/sametextstyle.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailtxt = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: formkey,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80),
                    Text(
                      'Forgot password',
                      style: SameTextStyle.heading,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Please, enter you email address.You will recieve a link to create a new password via email',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailtxt,
                      validator: (value) {
                        if (value!.contains('@') ||
                            value == null ||
                            value.trim().isEmpty) {
                          return 'Not a valid email adress .should be you@email.com';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              emailtxt.clear();
                            }),
                        label: Text(' Email'),
                        contentPadding: EdgeInsets.symmetric(vertical: 25),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {}
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            //  primary:Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
