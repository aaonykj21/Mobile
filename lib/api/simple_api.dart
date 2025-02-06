import 'dart:convert';
import 'package:demoproject/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SimpleApiCall extends StatefulWidget {
  const SimpleApiCall({super.key});

  @override
  State<SimpleApiCall> createState() => _SimpleApiCallState();
}

class _SimpleApiCallState extends State<SimpleApiCall> {
  List<UserData> users = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoaded = false;
    });

    // await Future.delayed(Duration(seconds: 4)); // Change Duration to Future.delayed
    try {
      var response = await http
          .get(Uri.parse('https://api.waqi.info/feed/here/?token=4f8aaec483f0d430baa394d2a6b91309f5df874f'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);

        setState(() {
          users = jsonList.map((item) => UserData.fromJson(item)).toList();
          isLoaded = true;
        });
        for (var user in users) {
          print(
              "ID: ${user.id}, Name: ${user.name}, Username: ${user.username}, Email: ${user.email}");
        }
      } else {
        print('Invalid data');
        setState(() {
          isLoaded = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: Text('Simple API Call')),
      ),

      body: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text("${index + 1}"),
                  title: Text("${users[index].name}"),
                  subtitle: Text("${users[index].email}"),
                  trailing: Text("${users[index].username}"),
                );
              }), // Add loading indicator while fetching data
    );
  }
}
