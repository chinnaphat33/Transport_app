import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child:
                  // ระยะห่างรอบ Container

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
                        Center(
                          child: SizedBox(
                            width: 350,
                            height: 250,
                            child: showlogo('picHome2.png'),
                          ),
                        ),
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
                        color: Colors.black),
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
                    child: SizedBox(
                        width: 350,
                        height: 250,
                        
                          child: showlogo('picHome3.png'),
                        ),
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
                      InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, 'login');
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 27),
                            width: 350,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.white, // สีพื้นหลัง
                              borderRadius:
                                  BorderRadius.circular(15), // มุมโค้ง
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "ชำระเงินเสร็จสิ้น",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  width: 200,
                                  height: 150,
                                  child: showlogo('payment_pic.png'),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "ชำระเงินง่าย ๆ ด้วยบัตร Visa หรือ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "PayPal โดยไม่ยุ่งยาก",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "ดูข้อมูลเพิ่มเติม",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, 'login');
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 27),
                            width: 350,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.white, // สีพื้นหลัง
                              borderRadius:
                                  BorderRadius.circular(15), // มุมโค้ง
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "ค้นหาสินค้าของคุณ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  width: 200,
                                  height: 150,
                                  child: showlogo('findproduct_pic.png'),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "เรานำเสนอการขายสินค้าผ่าน",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "ทางอินเทอร์เน็ต",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "ดูข้อมูลเพิ่มเติม",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, 'login');
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 27),
                            width: 350,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.white, // สีพื้นหลัง
                              borderRadius:
                                  BorderRadius.circular(15), // มุมโค้ง
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "รับสินค้าเรียบร้อย",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                    width: 200,
                                    height: 150,
                                    
                                      child: showlogo('getedproduct_pic.png'),
                                    ),
                                SizedBox(height: 15),
                                Text(
                                  "ในแอปของเรา ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "คุณสามารถตรวจสอบเวลาที่คำสั่งซื้อจะมาถึง",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "ดูข้อมูลเพิ่มเติม",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: showlogo('manholdphone_pic.png'),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        child: Align(
                          alignment:
                              Alignment.centerLeft, // จัดตำแหน่งให้อยู่ตรงกลาง
                          child: Text(
                            "ติดตามการจัดส่งของคุณได้ทุกเวลา",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "คุณสามารถตรวจสอบเวลาที่คำสั่งซื้ด้วยแอปของเราคุณสามารถติดตามเส้นทางการจัดส่งคำสั่งซื้อของคุณได้ตั้งแต่ศูนย์กลางของเราจนถึงสถานที่ที่คุณอยู่ดาวนโหลดแอปได้เลยตอนนี้",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        child: Align(
                          alignment:
                              Alignment.centerLeft, // จัดตำแหน่งให้อยู่ตรงกลาง
                          child: Text(
                            "ติดต่อเราที่นี่",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "คุณสามารถติดต่อเราผ่านช่องทางนี้ได้ ทั้งการเขียนข้อความ โทรหาเรา หรือมาเยี่ยมศูนย์บริการของเรา เรายินดีให้ความช่วยเหลือคุณด้วยความเต็มใจ",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "เบอร์โทรศัพท์: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "095-143-7744",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "อีเมล: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "delivery@gmail.com",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "สถานที่: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mumbai - India",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              color: Color.fromARGB(50, 0, 51, 102),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "การจัดส่ง",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ข้อมูลเพิ่มเติมเกี่ยวกับการจัดส่ง",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "บริการของเรา",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ราคา\nส่วนลด\nรายงานปัญหา\nข้อกำหนดการใช้บริการ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "เกี่ยวกับบริษัทของเรา",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "บล็อก\nพันธกิจของเรา",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "ชุมชน",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ฝ่ายสนับสนุน\nคำถามที่พบบ่อย\nบริการช่วยเหลือลูกค้า",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, size: 30, color: Colors.black),
                      SizedBox(width: 35),
                      Icon(Icons.message, size: 30, color: Colors.black),
                      SizedBox(width: 35),
                      Icon(Icons.share, size: 30, color: Colors.black),
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
