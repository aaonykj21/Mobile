import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: Answer4(),
  ));
}

class Answer4 extends StatelessWidget {
  const Answer4({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: const Color.fromARGB(255, 243, 185, 37),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 8.0),
                  Text('User Name', style: TextStyle(color: Colors.white, fontSize: 18),)
                ],
              ),
            ),
            Expanded(
            child: Container(
              color: const Color.fromARGB(255, 253, 252, 252),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.blue),
                      SizedBox(width: 8.0),
                      Text("user@example.com"),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.blue),
                      SizedBox(width: 8.0),
                      Text("123-456-7890"),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 8.0),
                      Text("123 Main Street"),
                    ],
                  ),
                ],
              ),
            ),
          ),
           const Spacer(), // ใช้ Spacer หรือ Expanded เพื่อเติมพื้นที่ว่าง
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Edit Profile'),
              ), const SizedBox(width: 20),
               ElevatedButton(
                onPressed: () {},
                child: const Text('Logout'),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}