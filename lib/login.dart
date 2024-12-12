import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

///////////// ฟังก์ชันการตรวจสอบข้อความใน textfeild เพื่อแสดงไอคอน Clear
  void initState() {
    super.initState();

    initStateEmail();
    initstatePass();
  }

  void dispose() {
    disposeEmail();
    disposePass();
    super.dispose();
  }

  void initStateEmail() {
    email.addListener(() {
      setState(() {});
    });
  }

  void disposeEmail() {
    email.dispose();
  }

  void initstatePass() {
    pass.addListener(() {
      setState(() {});
    });
  }

  void disposePass() {
    pass.dispose();
  }

  @override
  bool? isChecked = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_])[A-Za-z\d@$!%*?&_]{8,}$',
  );
  String? validatePassword(String passreg) {
    if (passreg.isEmpty) {
      print("Password: $pass");
      return 'โปรดกรอกรหัสผ่าน';
    } else if (!passwordRegex.hasMatch(passreg)) {
      print("Password does not match regex");
      return 'รหัสผ่านต้องมีอย่างน้อย:\n'
          '1 ตัวอักษรเล็ก, 1 ตัวอักษรใหญ่,\n'
          '1 ตัวเลข, และ 1 ตัวอักษรพิเศษ';
    }

    return null;
  }

  RegExp emailvalid = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );
  String? validateEmail(String emailreg) {
    String _email = emailreg.trim();
    if (emailreg.isEmpty) {
      return 'โปรดกรอกอีเมล';
    } else if (!emailvalid.hasMatch(emailreg)) {
      return 'รูปแบบอีเมลของท่านไม่ถูกต้อง';
    }
    return null;
  }

  Future sign_in() async {
    String url = "http://10.0.2.2/transport_login/login.php";
    final respone = await http.post(Uri.parse(url), body: {
      'email': email.text,
      'password': pass.text,
    });
    var data = json.decode(respone.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'login');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("เข้าสู่ระบบไม่สำเร็จ")));
    } else {
      Navigator.pushNamed(context, 'user');
    }
  }

// loginUI(){
//   return Consumer<FacebookSingincontroller>(
//     builder: (context, model, child)
//     {
//       if (model.userData != null)
//       {
//         return Center(
//           child: loginFacebookUI(model),
//         );
//       }
//     },
//     );
// }

// loginFacebookUI(FacebookSingincontroller model){
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Text(model.userData!["name"] ?? ''),
//       Text(model.userData!["email"]),
//       ActionChip(
//         label: Text("Logout"),
//         avatar: Icon(Icons.logout),
//         onPressed: (){
//           Provider.of<FacebookSingincontroller>(context, listen: false)
//           .logout();
//         })
//     ],
//   );
// }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF5F5F5),

      body: ListView(children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 22, 0),
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                  child: Text(
                    'หน้าหลัก',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(63, 63, 84, 1),
                    ),
                  )),
              Text('/'),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 252, 110, 28),
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(),
          child: Center(
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "เข้าสู่ระบบ ",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Transport',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 252, 110, 28),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3F60A0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                // Provider.of<FacebookSignincontroller>(context, listen: false)
                                // .loginFacebook();
                              },
                              child: Center(
                                child: Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                  size: 37,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 234, 64, 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                // googleSigninProvider.loginGoogle();
                              },
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                                size: 33,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const SizedBox(
                        child: Text('หริอ'),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 252, 110, 28),
                                width: 2,
                              ),
                            ),
                            suffixIcon: email.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      email.clear();
                                    }),
                            labelText: 'อีเมล',
                            labelStyle: TextStyle(
                              color: Colors.grey, // สีปกติของ label
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Color.fromARGB(
                                  255, 252, 110, 28), // สีของ label เมื่อ focus
                            ),
                          ),
                          validator: (value) => validateEmail(value ?? ''),
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: [AutofillHints.email],
                          controller: email,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 252, 110, 28),
                                width: 2,
                              ),
                            ),
                            suffixIcon: pass.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      pass.clear();
                                    }),
                            labelText: 'รหัสผ่าน',
                            labelStyle: TextStyle(
                              color: Colors.grey, // สีปกติของ label
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Color.fromARGB(
                                  255, 252, 110, 28), // สีของ label เมื่อ focus
                            ),
                          ),
                          validator: (val) => validatePassword(val ?? ''),
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
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              activeColor: Color.fromARGB(255, 252, 110, 28),
                              checkColor: Colors.white,
                            ),
                            Text('จดจำข้อมูลฉันไว้'),
                            SizedBox(
                              width: 115,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, 'resetpass');
                              },
                              child: const Text(
                                "ลืมรหัสผ่าน",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 252, 110, 28),

                                  decoration: TextDecoration
                                      .underline, // ใส่ขีดใต้ข้อความ
                                  decorationColor: Color.fromARGB(
                                      255, 252, 110, 28), // เลือกสีขีด
                                  decorationThickness: 1, // ความหนาของขีด
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: 350,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 26, 61, 99),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            bool pass = formKey.currentState!.validate();
                            if (pass) {
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
                          if (formKey.currentState?.validate() ?? false) {
                            // เมื่อกรอกข้อมูลถูกต้อง ส่ง OTP
                            Navigator.pushNamed(context, 'register');
                          }
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text(
                          "สมัครสมาชิก",
                          style: TextStyle(
                            color: Color.fromARGB(255, 252, 110, 28),

                            decoration:
                                TextDecoration.underline, // ใส่ขีดใต้ข้อความ
                            decorationColor:
                                Color.fromARGB(255, 252, 110, 28), // เลือกสีขีด
                            decorationThickness: 1, // ความหนาของขีด
                          ),
                        ),
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
