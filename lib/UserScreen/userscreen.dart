import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalName;

class Userscreen extends StatefulWidget {
  const Userscreen({Key? key}) : super(key: key);

  @override
  State<Userscreen> createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  int? selectedIndex; // เก็บ index ที่ถูกเลือก

  @override
  void initState() {
    super.initState();
    getvalidationData(); // เรียก getvalidationData เมื่อ Widget ถูกสร้าง
  }

  Future getvalidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedName = sharedPreferences.getString('email');
    setState(() {
      finalName = obtainedName;
    });
  }

  Future<void> logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear(); // ล้างข้อมูล SharedPreferences
    Navigator.pushReplacementNamed(context, 'login'); // ไปที่หน้า Login
  }

  Widget showlogo() {
    return Image.asset(
      'images/Transportuser_logo.png',
      height: 60,
      width: 60,
    );
  }

  Widget _buildListTile(
      int index, IconData icon, String title, VoidCallback onTap) {
    bool isSelected = selectedIndex == index; // ตรวจสอบสถานะการเลือก
    return Container(
      color: isSelected
          ? Colors.orange.shade700
          : Colors.transparent, // สีพื้นหลัง
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          setState(() {
            selectedIndex = index; // อัปเดตสถานะเมื่อกด ListTile
          });
          onTap();

          // ตั้งเวลาให้สีส้มอยู่แค่ 1 วินาที
          Future.delayed(Duration(milliseconds: 170), () {
            setState(() {
              selectedIndex = null; // รีเซ็ตสถานะเป็นปกติ
            });
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Transport',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue.shade900, // สีพื้นหลัง Drawer
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Colors.blue.shade900,
              child: Row(
                children: [
                  showlogo(),
                  SizedBox(width: 10),
                  Text(
                    'Transport',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white54, // สีเส้น
              thickness: 1, // ความหนา
              indent: 10, // ระยะห่างจากซ้าย
              endIndent: 10, // ระยะห่างจากขวา
            ),

            _buildListTile(
              0,
              Icons.home,
              'หน้าหลัก',
              () {
                Navigator.pop(context); // ปิด Drawer
                Future.delayed(Duration(milliseconds: 300), () {
                  Navigator.pushReplacementNamed(context, 'user');
                });
              },
            ),
            _buildListTile(
              1,
              Icons.check_box,
              'เช็ครายการพัสดุ',
              () {
                Navigator.pop(context); // ปิด Drawer
                Future.delayed(Duration(milliseconds: 300), () {
                  Navigator.pushReplacementNamed(context, 'checkparcel');
                });
              },
            ),
            _buildListTile(
              2,
              Icons.history,
              'ประวัติรายการ',
              () {},
            ),
            Spacer(),
            Divider(
              color: Colors.white54, // สีเส้น
              thickness: 1, // ความหนา
              indent: 10, // ระยะห่างจากซ้าย
              endIndent: 10, // ระยะห่างจากขวา
            ),
            // ข้อมูลผู้ใช้งาน
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                '$finalName',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              subtitle: Text(
                'สมาชิก',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: Icon(Icons.logout, color: Colors.white),
              onTap: () {
                logout();
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'เนื้อหาหลักของหน้าแอป',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้าง ListTile พร้อมเปลี่ยนสีเมื่อถูกเลือก
}
