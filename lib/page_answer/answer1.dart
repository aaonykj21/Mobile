import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: Answer1(),
  ));
}

class Answer1 extends StatelessWidget {
  const Answer1({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Layout'),
        backgroundColor: const Color.fromARGB(255, 254, 184, 8),
        centerTitle: true
      ),
      body: Column(
        children: [const SizedBox(height: 20),
          Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [ const SizedBox(width: 20),
          Container(
            width: 100,
            height: 100,
            color : Colors.pink
          ),const SizedBox(width: 20),
           Container(
            width: 100,
            height: 100,
            color : const Color.fromARGB(255, 50, 233, 30)
          ),const SizedBox(width: 20),
           Container(
            width: 100,
            height: 100,
            color : const Color.fromARGB(255, 36, 114, 192)
          ), const SizedBox(width: 20)],
        ), const SizedBox(height: 20),
        Row( mainAxisAlignment: MainAxisAlignment.center,
        children: [ const SizedBox(width: 20),
          Container(
            width: 100,
            height: 100,
            color : const Color.fromARGB(255, 233, 179, 30)
          ),const SizedBox(width: 20),
           Container(
            width: 100,
            height: 100,
            color : const Color.fromARGB(255, 207, 30, 193)
          ),const SizedBox(width: 20),
           Container(
            width: 100,
            height: 100,
            color : const Color.fromARGB(255, 228, 234, 111)
          ), const SizedBox(height: 20,width: 20)],
        )],
        
      )
    );

  }
}