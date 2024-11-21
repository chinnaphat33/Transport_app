import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  Widget showlogo() {
    return Image.asset(
      'images/Transpot.jpg',
      height: 50,
      width: 50,
    );
  }

  @override

  bool? isChecked = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future sign_in() async {
    String url = "http://10.0.2.2/transport_login/login.php";
    final respone = await http.post(Uri.parse(url), body: {
      'email': email.text,
      'password': pass.text,
    });
    var data = json.decode(respone.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'home');
    } else {
      Navigator.pushNamed(context, 'login');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Transport Application'),
      ),
      body: ListView(children: [
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

              // ส่วนของ Search Bar ชั่วคราว
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

                  // ส่วยของปุ่ม Icon
                  Padding(
                    padding: const EdgeInsets.only(right: 13.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.person, color: Colors.black),
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
            ],
          ),
        ),
        Container(
          color: Color.fromARGB(255, 26, 61, 99),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'หน้าหลัก',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'เกี่ยวกับ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'บริการ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'คำแนะนำ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'ติดต่อเรา',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 50, 50, 0),
          padding: const EdgeInsets.all(25),
          color: const Color.fromARGB(217, 202, 202, 208),
          child: Center(
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        child: Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3F60A0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'เข้าสู่ระบบ Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 227, 32, 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'เข้าสู่ระบบ Gmail',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'อีเมลล์',
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'โปรดกรอกข้อมูล';
                            }
                            return null;
                          },
                          controller: email,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'รหัสผ่าน',
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'โปรดกรอกข้อมูล';
                            }
                            return null;
                          },
                          controller: pass,
                        ),
                      ),
                      const SizedBox(
                          height: 2,
                        ),
                         SizedBox(
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked, 
                                onChanged: (bool? value){
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 252, 110, 28),
                                checkColor: Colors.white,
                                ),
                                Text('จดจำข้อมูลฉันไว้'),
                            ],
                          ),
                        ),
                      const SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        width: 325,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 252, 110, 28),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          onPressed: () {
                            bool pass = formKey.currentState!.validate();
                              if(pass)
                              {
                                sign_in();
                              }
                          },
                          child: const Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child:
                            const Text("Didn't have any Account? Sign Up now"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
