import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color backgroundColor;
  final bool isCircle;
  final BoxDecoration decoration;  // เพิ่ม BoxDecoration สำหรับการตั้งค่าขอบ

  CustomCard({
    required this.backgroundColor, 
    this.isCircle = false, 
    this.decoration = const BoxDecoration(), // ใช้ default BoxDecoration
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,  // ขนาดของการ์ด
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: decoration.copyWith(  // ใช้ decoration ที่ส่งเข้ามา
        color: backgroundColor,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
    );
  }
}
