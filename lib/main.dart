// import 'package:demoproject/api/simple_api.dart';
// import 'package:demoproject/Homework2/air_quality.dart';
// import 'package:demoproject/fire_store/fire_store_demo.dart';
import 'package:demoproject/Profile/ProfileCard.dart';
// import 'package:demoproject/Profile/ProfileCard.dart';
// import 'package:demoproject/component/custom_card.dart';
// import 'package:demoproject/component/custom_card.dart';
// import 'package:demoproject/component/custom_counter.dart';
// import 'package:demoproject/product/product_api.dart';
// import 'package:demoproject/form_widget/form_simple.dart';
// import 'package:demoproject/page_answer/answer1.dart';
// import 'package:demoproject/my_statefull_widget.dart';
// import 'package:demoproject/page_answer/answer2.dart';
// import 'package:demoproject/page_answer/answer3.dart';
// import 'package:demoproject/aqi/air_quality.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        title: 'ThemeMode Demo',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 206, 181, 249)),
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.blueGrey[900],
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
        ),
        themeMode: _themeMode,
        home:  MyWidget(toggleTheme: _toggleTheme, themeMode: _themeMode),
        );
  }
}

// class Traffic extends StatefulWidget {
//   const Traffic({super.key});

//   @override
//   State<Traffic> createState() => _TrafficState();
// }

// class _TrafficState extends State<Traffic> {
//   int _lightStatus = 0;

//   void _changeLight() {
//     setState(() {
//       _lightStatus = (_lightStatus + 1) % 3;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Traffic Light Animation')),
//         backgroundColor: const Color.fromARGB(104, 233, 30, 98),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // ไฟแดงกับการเปลี่ยน opacity
//             AnimatedOpacity(
//               opacity: _lightStatus == 0 ? 1.0 : 0.3,
//               duration: Duration(seconds: 1),
//               child: CustomCard(
//                 backgroundColor: const Color.fromARGB(255, 234, 33, 33),
//                 isCircle: true,
//                decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color.fromARGB(255, 234, 33, 33).withOpacity(0.5), // สีของขอบฟุ้ง
//                       blurRadius: 10.0, // เบลอขอบ
//                       spreadRadius: 8.0, // ขยายขอบ
//                       offset: Offset(0, 4), // การเลื่อนขอบ
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // ไฟเหลืองกับการเปลี่ยน opacity
//             AnimatedOpacity(
//               opacity: _lightStatus == 1 ? 1.0 : 0.3,
//               duration: Duration(seconds: 1),
//               child: CustomCard(
//                 backgroundColor: const Color.fromARGB(255, 241, 244, 47),
//                 isCircle: true,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color.fromARGB(255, 241, 244, 47).withOpacity(0.5), // สีของขอบฟุ้ง
//                       blurRadius: 10.0, // เบลอขอบ
//                       spreadRadius: 8.0, // ขยายขอบ
//                       offset: Offset(0, 4), // การเลื่อนขอบ
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // ไฟเขียวกับการเปลี่ยน opacity
//             AnimatedOpacity(
//               opacity: _lightStatus == 2 ? 1.0 : 0.3,
//               duration: Duration(seconds: 1),
//               child: CustomCard(
//                 backgroundColor: const Color.fromARGB(255, 60, 248, 46),
//                 isCircle: true,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color.fromARGB(255, 60, 248, 46).withOpacity(0.5), // สีของขอบฟุ้ง
//                       blurRadius: 10.0, // เบลอขอบ
//                       spreadRadius: 8.0, // ขยายขอบ
//                       offset: Offset(0, 4), // การเลื่อนขอบ
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 40),
//             // ปุ่มสำหรับเปลี่ยนสถานะของไฟ
//             ElevatedButton(
//               onPressed: _changeLight,
//               child: Text('เปลี่ยนไฟ'),
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 250, 226, 243)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AnimatedContainerDemo extends StatefulWidget {
//   const AnimatedContainerDemo({super.key});

//   @override
//   State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
// }

// class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
//   double _size = 100;
//   Color _color = Colors.blue;

//   void _changeBox() {
//     setState(() {
//       _size = _size == 100 ? 200 : 100;
//       _color = _color == Colors.blue ? Colors.red : Colors.blue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Animated Container'),),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedContainer(
//               duration: const Duration(seconds: 1), // ระยะเวลาของ Animation
//               curve: Curves.easeInOut, // รูปแบบการเคลื่อนไหว
//               width: _size, // เปลี่ยนขนาดความกว้าง
//               height: _size, // เปลี่ยนขนาดสูง
//               color: _color, // เปลี่ยนสี
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _changeBox,
//               child: const Text('Animate Box'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyWidget extends StatefulWidget {
  final VoidCallback toggleTheme;
  final ThemeMode themeMode;

  const MyWidget({super.key, required this.toggleTheme, required this.themeMode});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Example'),
        actions: [
          IconButton(
            icon: Icon(widget.themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      //  body: Center(
      //     child: Column(
      //       children: [
      //         CustomCard(text: 'Blue', backgroundColor: const Color.fromARGB(255, 29, 16, 166), isCircle: true),
      //         SizedBox(height: 20),
      //         CustomCard(text: 'Red', backgroundColor: const Color.fromARGB(255, 168, 35, 48)),
      //         SizedBox(height: 20),
      //         CustomCard(text: 'Yellow', backgroundColor: const Color.fromARGB(255, 225, 207, 85)),
      //       ],
      //     )

      //   )
        // body: const Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       CustomCounterWidget(
        //         title: 'TEAM A',
        //         backgroundColor: Colors.red,
        //       ),
        //       SizedBox(height: 10),
        //       CustomCounterWidget(
        //           title: 'TEAM B', backgroundColor: Colors.blue),
        //     ],
        //   ),
        // )
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileCard(
              name: 'Natcha Yakermjit',
              position: 'Mermaid',
              email: 'yakermjit_n@silpakorn.edu',
              phone: '0875300713',
              imageUrl:
                  'https://i.etsystatic.com/42415510/r/il/183104/5630941975/il_fullxfull.5630941975_6vtw.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

