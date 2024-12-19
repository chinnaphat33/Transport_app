import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';

class resetpass2 extends StatefulWidget {
  const resetpass2({Key? key}) : super(key: key);

  @override
  State<resetpass2> createState() => _resetpass2();
}

class _resetpass2 extends State<resetpass2> {

  
  final _formKey = GlobalKey<FormState>(); // Declare the form key
  TextEditingController otp = TextEditingController();
  TextEditingController pass = TextEditingController();
  String emailUser = '';

  Future<bool> verifyOTP(
      BuildContext context, TextEditingController otpController) async {
    if (await EmailOTP.verifyOTP(otp: otpController.text)) {
      Navigator.pushNamed(context, 'newpass', arguments: emailUser);
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("รหัส OTP ไม่ถูกต้อง")),
      );
      Navigator.pushNamed(context, 'resetpass2');
      return false;
    }
  }
  void didChangeDependencies() {
  super.didChangeDependencies();
  final args = ModalRoute.of(context)?.settings.arguments;
  if (args != null && args is String) {
    emailUser = args;
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
                            'Transport2',
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
            child: SizedBox(
              width: 350,
              child: Column(children: [
                // OTP Field with Validation
                TextFormField(
                  controller: otp,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'OTP',
                    labelStyle: const TextStyle(
                      color: Colors.grey, // สีปกติของ label
                    ),
                    floatingLabelStyle: const TextStyle(color: Colors.orange),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรหัส OTP';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                // Submit Button
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
                        // เมื่อกรอกข้อมูลถูกต้อง ส่ง OTP
                        verifyOTP(context, otp);
                      }
                    },
                    child: const Text(
                      'ยืนยันรหัส OTP',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ]));
  }
}
