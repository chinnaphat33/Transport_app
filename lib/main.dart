import 'package:flutter/material.dart';
import 'package:flutter_login/home.dart';
import 'package:flutter_login/otpscreen.dart';
import 'package:flutter_login/re_password/OTPsendResetpass.dart';
import 'package:flutter_login/re_password/OTPverifyResetpass.dart';
import 'package:flutter_login/re_password/newpassword.dart';
import 'package:flutter_login/userscreen.dart';
import 'login.dart';
import 'register.dart';
  
void main() {[
  runApp(
 
         MyApp(),
    ),
];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
      routes: {
        'register': (context) => register(),
        'home': (context) => Homepage(),
        'login': (context) => login(),
        'user': (context) => Userscreen(),
        'otp': (context) => Otpscreen(),
        'resetpass': (context) => resetpass(),
        'resetpass2': (context) => resetpass2(),
        'newpass': (context) => newpass(),
      },
    );
  }
}
