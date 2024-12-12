import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';
import 'package:email_otp/email_otp.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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

    initStateName();
    initStateEmail();
    initstatePass();
  }

  void dispose() {
    disposeName();
    disposeEmail();
    disposePass();
    super.dispose();
  }

  void initStateName() {
    name.addListener(() {
      setState(() {});
    });
  }

  void disposeName() {
    name.dispose();
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

  final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_])[A-Za-z\d@$!%*?&_]{8,}$',
  );

  String? validatePassword(String passreg) {
    if (passreg.isEmpty) {
      print("Password: $passreg");
      return 'โปรดกรอกรหัสผ่าน';
    } else if (!passwordRegex.hasMatch(passreg)) {
      print("Password does not match regex");
      return 'รหัสผ่านต้องมีอย่างน้อย:\n'
          '1 ตัวอักษรเล็ก, 1 ตัวอักษรใหญ่,\n'
          '1 ตัวเลข, และ 1 ตัวอักษรพิเศษ';
    }

    return null;
  }

  Color _buttonColor = const Color.fromARGB(255, 26, 61, 99);
  void _changeColor() {
    setState(() {
      // เปลี่ยนสีเป็นสีใหม่ (เช่น สีที่ต้องการหลังจากกด)
      _buttonColor = const Color.fromARGB(70, 0, 51, 102);

      // เรียกฟังก์ชัน sendOTP หรือฟังก์ชันอื่นๆ ที่คุณต้องการ
      // sendOTP(context, email);
    });
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

  String? validateCheckbox(bool? value) {
    if (value == null || !value) {
      return 'กรุณาเลือก checkbox';
    }
    return null;
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController otp = TextEditingController();

  Future sign_up() async {
    String url = "http://10.0.2.2/transport_login/register.php";
    final respone = await http.post(Uri.parse(url), body: {
      'name': name.text,
      'email': email.text,
      'password': pass.text,
    });

    var data = json.decode(respone.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'register');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("อีเมลของท่านทำการใช้งานแล้ว")),
      );
    } else {
      Navigator.pushNamed(context, 'login');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("ลงทะเบียนเสร็จสิ้น")),
      );
    }
  }

  Future<void> sendOTP(
      BuildContext context, TextEditingController emailController) async {
    if (await EmailOTP.sendOTP(email: emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP has been sent")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP failed to send")),
      );
    }
  }

  // ฟังก์ชัน verifyOTP
  Future<bool> verifyOTP(
      BuildContext context, TextEditingController otpController) async {
    if (await EmailOTP.verifyOTP(otp: otpController.text)) {
      Navigator.pushNamed(context, 'login');
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("รหัส OTP ไม่ถูกต้อง")),
      );
      Navigator.pushNamed(context, 'register');
      return false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(children: [
        ListView(children: [
          Column(
            children: [
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
                          Navigator.pushNamed(context, 'register');
                        },
                        child: Text(
                          'สมัครสมาชิก',
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
                                child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "สมัครสมาชิกกับ",
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
                                )
                              ],
                            )),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 350,
                              child: Stack(
                                children: [
                                  TextFormField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      labelText: 'ชื่อ-นามสกุล',
                                      labelStyle: TextStyle(
                                        color: Colors.grey, // สีปกติของ label
                                      ),
                                      floatingLabelStyle: TextStyle(
                                        color: Color.fromARGB(255, 252, 110,
                                            28), // สีของ label เมื่อ focus
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 252, 110, 28),
                                          width: 2,
                                        ),
                                      ),
                                      suffixIcon: name.text.isEmpty
                                          ? null
                                          : IconButton(
                                              icon: Icon(Icons.close),
                                              onPressed: () {
                                                name.clear();
                                              }),
                                    ),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'โปรดกรอกข้อมูล';
                                      }
                                      return null;
                                    },
                                    controller: name,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 350,
                              child: TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  labelText: 'อีเมล',
                                  labelStyle: TextStyle(
                                    color: Colors.grey, // สีปกติของ label
                                  ),
                                  floatingLabelStyle: TextStyle(
                                    color: Color.fromARGB(255, 252, 110,
                                        28), // สีของ label เมื่อ focus
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 252, 110, 28),
                                      width: 2,
                                    ),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize
                                        .min, // ป้องกัน Row กินพื้นที่ทั้งหมด
                                    children: [
                                      if (email.text.isNotEmpty)
                                        IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            email.clear();
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                                validator: (val) => validateEmail(val ?? ''),
                                keyboardType: TextInputType.emailAddress,
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
                                    color: Color.fromARGB(255, 252, 110,
                                        28), // สีของ label เมื่อ focus
                                  ),
                                ),
                                validator: (val) => validatePassword(val ?? ''),
                                controller: pass,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'หมายเหตุ: รหัสผ่านต้องมีอย่างน้อย 1 ตัวอักษรเล็ก, '
                                '1 ตัวอักษรใหญ่ 1 ตัวเลข และ 1 ตัวอักษรพิเศษ',
                                style: TextStyle(
                                  fontSize: 11,
                                ),
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
                                  labelText: 'ยืนยันรหัสผ่าน',
                                  labelStyle: TextStyle(
                                    color: Colors.grey, // สีปกติของ label
                                  ),
                                  floatingLabelStyle: TextStyle(
                                    color: Color.fromARGB(255, 252, 110,
                                        28), // สีของ label เมื่อ focus
                                  ),
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'โปรดกรอกข้อมูล';
                                  } else if (val != pass.text) {
                                    return 'รหัสผ่านไม่ตรงกัน';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 350,
                              height: 55,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      _buttonColor, // ใช้สีจากตัวแปรสถานะ
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed:
                                    _changeColor, // เรียกฟังก์ชันเมื่อกดปุ่ม
                                child: const Text(
                                  'ส่ง OTP',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 350,
                              child: TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  labelText: 'OTP',
                                  labelStyle: TextStyle(
                                    color: Colors.grey, // สีปกติของ label
                                  ),
                                  floatingLabelStyle: TextStyle(
                                    color: Color.fromARGB(255, 252, 110,
                                        28), // สีของ label เมื่อ focus
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 252, 110, 28),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                controller: otp,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            FormField<bool>(
                              validator: (value) => validateCheckbox(value),
                              builder: (FormFieldState<bool> state) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                            state.didChange(
                                                value); // อัพเดทค่าใน FormField
                                          },
                                          activeColor:
                                              Color.fromARGB(255, 252, 110, 28),
                                          checkColor: Colors.white,
                                        ),
                                        Text(
                                          'ข้าพเจ้าอ่าน และยอมรับ ข้อตกลงการใช้\nและนโยบายความเป็นส่วนตัว',
                                          style: TextStyle(
                                            fontSize:
                                                12, // คุณสามารถปรับขนาดตัวอักษรที่นี่
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (state.hasError)
                                      Text(
                                        state.errorText!,
                                        style: TextStyle(color: Colors.red),
                                      ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
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
                                onPressed: () async {
                                  // รอให้ verifyOTP ทำงานเสร็จก่อน
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    // เมื่อกรอกข้อมูลถูกต้อง ส่ง OTP
                                    bool otpVerified =
                                        await verifyOTP(context, otp);

                                    // หาก OTP ถูกต้อง ให้ทำการสมัครสมาชิก
                                    if (otpVerified) {
                                      // ทำการสมัครสมาชิก
                                      await sign_up();

                                      // หลังจากสมัครสมาชิกเสร็จแล้ว เปลี่ยนหน้าไปยังหน้า login
                                    }
                                  }
                                },
                                child: const Text(
                                  'สมัครสมาชิก',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ]),
    );
  }
}
