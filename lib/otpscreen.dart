// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_login/login.dart';
import 'package:http/http.dart' as http;

class Otpscreen extends StatefulWidget {
  const Otpscreen({Key? key}) : super(key: key);

  @override
  State<Otpscreen> createState() => _Otpscreen();
}

class _Otpscreen extends State<Otpscreen> {
  Widget showlogo() {
    return Image.asset(
      'images/Transpot.jpg',
      height: 50,
      width: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transport Application'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(children: [
        Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: showlogo(),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: 200,
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'ค้นหา...',
                                suffixIcon: const Icon(Icons.search),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ส่วนของปุ่ม Icon
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            child: PopupMenuButton<String>(
                              icon:
                                  const Icon(Icons.person, color: Colors.black),
                              onSelected: (String value) {
                                if (value == 'login') {
                                  print("เข้าสู่ระบบ");
                                  Navigator.pushNamed(context, 'login');
                                } else if (value == 'register') {
                                  print("สมัครสมาชิก");
                                  Navigator.pushNamed(context, 'register');
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                const PopupMenuItem<String>(
                                  value: 'login',
                                  child: Text('เข้าสู่ระบบ'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'register',
                                  child: Text('สมัครสมาชิก'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
        Container(
          height: 60,
          color: Color.fromARGB(255, 26, 61, 99),
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  padding: EdgeInsets.zero,
                  minimumSize: Size(50, 50),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                child: Text('หน้าหลัก'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  padding: EdgeInsets.zero,
                  minimumSize: Size(50, 50),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                child: Text('เกี่ยวกับ'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  padding: EdgeInsets.zero,
                  minimumSize: Size(50, 50),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                child: Text('บริการ'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  padding: EdgeInsets.zero,
                  minimumSize: Size(50, 50),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                child: Text('คำแนะนำ'),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 26, 61, 99),
              width: 3,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          margin: const EdgeInsets.fromLTRB(50, 100, 50, 0),
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'OTP',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),




              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 252, 110, 28),
                        width: 2,
                      ),
                    ),
                    labelText: 'ยืนยันรหัส OTP',
                    labelStyle: TextStyle(
                      color: Colors.grey, // สีปกติของ label
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Color.fromARGB(
                          255, 252, 110, 28), // สีของ label เมื่อ focus
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 252, 110, 28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'ยืนยัน',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
