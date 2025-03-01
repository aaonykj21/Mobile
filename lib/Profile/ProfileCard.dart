import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phone;
  final String imageUrl;

  const ProfileCard({
    required this.name, 
    required this.position, 
    required this.email, 
    required this.phone, 
    required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(16),
       margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // มุมโค้งมน
         color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(255, 107, 104, 104)  // สีสำหรับโหมด dark
            : Colors.white,     
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // เงาสีดำแบบโปร่งแสง
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
     child: Column(
      children: [
        CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 10),

          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),

          Text(
            position,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, size: 16, color: Colors.blue),
              SizedBox(width: 5),
              Text(email, style: TextStyle(fontSize: 14)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, size: 16, color: Colors.green),
              SizedBox(width: 5),
              Text(phone, style: TextStyle(fontSize: 14)),
            ],
          ),
      ],
     ),
    );
  }
}