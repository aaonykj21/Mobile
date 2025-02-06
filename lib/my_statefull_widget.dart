import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StatefulWidget"), backgroundColor: const Color.fromARGB(255, 239, 31, 31)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter = $counter"),
            const SizedBox(height: 20),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [ ElevatedButton(
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
              child: const Icon(Icons.remove),
            ),const SizedBox(width: 20)
             ,
             ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Icon(Icons.add),
            )],
            ),
            
          ],
        ),
      ),
    );
  }
}
