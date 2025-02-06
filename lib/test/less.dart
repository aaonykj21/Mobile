import 'package:demoproject/main.dart';
import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String name;
  const GreetingWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : Center(child: Text('Hello, $name', style: const TextStyle(fontSize: 24),),)
    );
  }
}

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const GreetingWidget(name: 'Natcha Yakermjit'),
    );
  }

}
