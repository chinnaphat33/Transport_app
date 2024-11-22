import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userscreen extends StatefulWidget {
  const Userscreen({Key? key}) : super(key: key);

  @override
  State<Userscreen> createState() => _userscreen();
}

class _userscreen extends State<Userscreen> {
  Widget showlogo() {
    return Image.asset(
      'images/Transportuser_logo.png',
      height: 170,
      width: 170,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Transport Application'),
      ),
      drawer: Drawer(
        width: 300,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: showlogo(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'ผู้ใช้งาน',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
