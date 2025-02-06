import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Answer2(),
  ));
}

class Answer2 extends StatelessWidget {
  const Answer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Social Media Post'),
            backgroundColor: const Color.fromARGB(255, 254, 184, 8),
            centerTitle: true),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                    width: 50, // กำหนดขนาดวงกลม
                    height: 50, // กำหนดขนาดวงกลม
                    decoration: const BoxDecoration(
                      color: Colors.blue, // สีของวงกลม
                      shape: BoxShape.circle, // ทำให้เป็นวงกลม
                    )),
                const SizedBox(width: 10),
                const Column(
                  children: [
                    Text('User Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('5 minutes ago',
                        style: TextStyle(fontSize: 14, color: Colors.grey))
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [  const SizedBox(width: 20),
              ElevatedButton(
              onPressed: () {},
              child: const Text('Like'),
            ),const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Comment'),
            ),const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Share'),
            ),const SizedBox(width: 20),
            ],)
          ],
        ));
  }
}
