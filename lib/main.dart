// import 'package:demoproject/api/simple_api.dart';
// import 'package:demoproject/Homework2/air_quality.dart';
// import 'package:demoproject/fire_store/fire_store_demo.dart';
import 'package:demoproject/product/product_api.dart';
// import 'package:demoproject/form_widget/form_simple.dart';
// import 'package:demoproject/page_answer/answer1.dart';
// import 'package:demoproject/my_statefull_widget.dart';
// import 'package:demoproject/page_answer/answer2.dart';
// import 'package:demoproject/page_answer/answer3.dart';
// import 'package:demoproject/aqi/air_quality.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Product());
  }
}
