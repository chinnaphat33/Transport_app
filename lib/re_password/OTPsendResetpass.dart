
import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';

class resetpass extends StatefulWidget {
  const resetpass({Key? key}) : super(key: key);

  @override
  State<resetpass> createState() => _resetpass();
}

class _resetpass extends State<resetpass> {
  TextEditingController otp = TextEditingController();
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // สำหรับการ validate
  

  void initState() {
    super.initState();
    initStateEmail();
  }

  void dispose() {
    disposeEmail();
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

  RegExp emailvalid = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  String? validateEmail(String emailreg) {
    if (emailreg.isEmpty) {
      return 'โปรดกรอกอีเมล';
    } else if (!emailvalid.hasMatch(emailreg)) {
      return 'รูปแบบอีเมลไม่ถูกต้อง';
    }
    return null;
  }

  Future<void> sendOTP(BuildContext context, TextEditingController emailController) async {
    if (await EmailOTP.sendOTP(email: emailController.text)) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP has been sent")),
      );
      
      Navigator.pushNamed(context, 'resetpass2', arguments: email.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP failed to send")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 22, 0),
            width: double.infinity,
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
                key: _formKey, // กำหนด key สำหรับฟอร์ม
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 30),
                        Text(
                          "รีเซ็ตรหัสผ่าน ",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(width: 7),
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
                    SizedBox(height: 30), // เว้นระยะห่าง
                    // TextFormField สำหรับกรอกอีเมล
                    TextFormField(
                      controller: email,
                      obscureText: false,
                      validator: (value) {
                        return validateEmail(value ?? ''); // ใช้ฟังก์ชัน validateEmail
                      },
                      decoration: InputDecoration(
                        labelText: 'อีเมล',
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(
                          color: Color.fromARGB(255, 252, 110, 28),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 252, 110, 28),
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    // ปุ่มส่ง OTP
                    SizedBox(
                      width: 375
                      ,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 26, 61, 99),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // เมื่อกรอกข้อมูลถูกต้อง ส่ง OTP
                            sendOTP(context, email);
                          }
                        },
                        child: const Text(
                          'รีเซ็ตรหัสผ่าน',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

