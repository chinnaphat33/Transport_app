import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget showlogo(String imageName) {
    return Image.asset(
      'images/$imageName',
      height: 350,
      width: 350,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30), // ระยะห่างรอบ Container
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ข้อความด้านบน
                Text(
                  "สั่งซื้อสินค้าได้เร็วขึ้น\nและง่ายดายยิ่งขึ้น",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "สั่งของที่คุณถูกใจได้ทุกเวลา\nและเราจะจัดส่งตรงถึงที่ของคุณ",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  alignment: Alignment.centerLeft, // จัดปุ่มให้ชิดซ้าย
                  // margin: EdgeInsets.only(left: ), // ระยะห่างจากขอบซ้าย
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF003366), // สีปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // มุมโค้งของปุ่ม
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    child: SizedBox(
                      width: 150, // กำหนดความกว้างของปุ่ม
                      height: 50, // กำหนดความสูงของปุ่ม
                      child: Center(
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // รูปภาพ
                Center(
                  child: Column(
                    children: [
                      showlogo('picHome1.png'),
                      SizedBox(height: 20),
                      showlogo('picHome2.png'),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // ข้อความเกี่ยวกับบริษัท
                Text(
                  "รู้จักเราให้มากขึ้นอีกนิด\n",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "เราเป็นบริษัทที่มุ่งมั่นในการจัดจำหน่ายสินค้าโดย\nการจัดส่งถึงบ้านหรือสถานที่ที่คุณอยู่พร้อมมอบ\nบริการจัดส่งที่มีคุณภาพดีที่สุดให้กับคุณ",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 30),

                // ข้อความเกี่ยวกับความปลอดภัย
                Text(
                  "ความปลอดภัยของคุณสำคัญสำหรับเรา\n",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,9
                  ),
                ),
                Text(
                  "เมื่อคำสั่งซื้อของคุณมาถึงเรามีมาตรการด้านความ\nปลอดภัยทางสุขภาพเพื่อปกป้องคุณจากโรคต่าง ๆ\nรับชมวิดีโอเกี่ยวกับขั้นตอนการจัดส่งได้เลย",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 40),

                // รูปภาพเพิ่มเติม
                Center(
                  child: showlogo('picHome3.png'),
                ),
                SizedBox(height: 40),
                Center(
                  child: Column(children: [
                    Container(
                      child: Text(
                        "บริการบางส่วนที่เรานำเสนอ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: [
                        Container(
                          width: 300, // ความกว้างของ Container
                          // padding: EdgeInsets.all(20), // ระยะห่างภายใน
                          decoration: BoxDecoration(
                            color: Colors.white, // สีพื้นหลัง
                            borderRadius: BorderRadius.circular(15), // มุมโค้ง
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2), // สีของเงา
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 3), // การเลื่อนตำแหน่งของเงา
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .transparent, // ทำให้พื้นหลังโปร่งใส
                                  shadowColor:
                                      Colors.transparent, // ลบเงาของปุ่ม
                                  padding: EdgeInsets.zero, // ลบ padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15), // มุมโค้งของปุ่ม
                                  ),
                                ),
                                onPressed: () {
                                  print('Button pressed!');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      15), // มุมโค้งของรูปภาพ
                                  child: Image.asset(
                                    'images/payment_pic.png', // รูปภาพในปุ่ม
                                    width:
                                        300, // ทำให้รูปภาพเต็มความกว้างของ Container
                                    height: 150, // ความสูงของรูปภาพ
                                    fit: BoxFit
                                        .cover, // ปรับรูปภาพให้เต็มพื้นที่โดยไม่เสียสัดส่วน
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
