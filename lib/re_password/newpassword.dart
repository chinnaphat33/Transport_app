import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class newpass extends StatefulWidget {
  const newpass({Key? key}) : super(key: key);

  @override
  State<newpass> createState() => _newpass();
}

class _newpass extends State<newpass> {
  final _formKey = GlobalKey<FormState>(); // Declare the form key

  // TextEditingController pass = TextEditingController();
  final TextEditingController newpass = TextEditingController();
  String emailUser = '';

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

  Future<void> _updatePassword() async {
    print("Email User: $emailUser");
    if (emailUser.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ไม่พบอีเมลผู้ใช้')),
      );
      return;
    }
    if (_formKey.currentState?.validate() ?? false) {
      String newPassword = newpass.text;

      // URL ของ PHP script ที่ทำการอัปเดตในฐานข้อมูล
      String url = "http://10.0.2.2/transport_login/updatepass.php";

      // ส่งข้อมูลไปยัง PHP script
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          }, // เพิ่ม header เพื่อให้ PHP อ่านข้อมูลจาก $_POST ได้ถูกต้อง
          body: {
            'email': emailUser,
            'newPassword': newPassword,
          },
        );

        print('Response body: ${response.body}');
        print('Status code: ${response.statusCode}');
        // ตรวจสอบผลลัพธ์จาก PHP script
        if (response.statusCode == 200) {
          // ถ้าอัปเดตสำเร็จ
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('รหัสผ่านอัปเดตสำเร็จ')));
          Navigator.pushNamed(context, 'login');
        } else {
          // ถ้าไม่สำเร็จ
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('ไม่สามารถอัปเดตได้')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('เกิดข้อผิดพลาดในการเชื่อมต่อ')));
      }
      print('Updating password for email: $emailUser');
      print("New Password (before sending): ${newpass.text}");
    }
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    // รับอีเมลจาก arguments
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is String) {
      emailUser = args;
      print('Received email: $emailUser');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 22, 0),
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                  child: const Text(
                    'หน้าหลัก',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(63, 63, 84, 1),
                    ),
                  )),
              const Text('/'),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: const Text(
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
          child: Center(
            child: Form(
              key: _formKey, // Attach the form key
              child: ListView(shrinkWrap: true, children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          "รีเซ็ตรหัสผ่าน ",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Transport3',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 252, 110, 28),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(22, 20, 22, 0),
          child: Column(
            children: [
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
                    suffixIcon: newpass.text.isEmpty
                        ? null
                        : IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              newpass.clear();
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
                  controller: newpass,
                ),
              ),
              const SizedBox(
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
                      color: Color.fromARGB(
                          255, 252, 110, 28), // สีของ label เมื่อ focus
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'โปรดกรอกข้อมูล';
                    } else if (val != newpass.text) {
                      return 'รหัสผ่านไม่ตรงกัน';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 375,
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
                      _updatePassword();
                    }
                  },
                  child: const Text(
                    'ยืนยันรหัสผ่านใหม่',
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
        )
      ]),
    );
  }
}
