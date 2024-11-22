import 'package:flutter/material.dart';
import 'package:flutter_login/home.dart';
import 'package:flutter_login/userscreen.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
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
      home: const homepage(),
      routes: {
        'register': (context) => register(),
        'home':(context) => homepage(),
        'login':(context) => login(),
        'user':(context) => Userscreen(),
      },
    );
  }
}
