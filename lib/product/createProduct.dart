import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

bool _isDisposed = false;

@override
void dispose() {
  _isDisposed = true; 
  nameController.dispose();
  descriptionController.dispose();
  priceController.dispose();
  super.dispose();
}

 Future<void> createProduct() async {
  try {
    var response = await http.post(
      Uri.parse("http://10.0.2.2:8001/products"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": nameController.text.trim(),
        "description": descriptionController.text.trim(),
        "price": double.tryParse(priceController.text) ?? 0.0,
      }),
    );

    if (!mounted) return; 

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product added successfully!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context, true);
    } else {
      throw Exception("Failed to add product");
    }
  } catch (e) {
    if (!mounted) return; 
    print("❌ Error: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("An error occurred! Please try again."),
        backgroundColor: Colors.red,
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("AddProduct"),
          backgroundColor: const Color.fromARGB(255, 147, 201, 242)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Product Name"),
            SizedBox(height: 10,),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter Product Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 236, 71, 214), width: 2.0), 
                ),
                filled: true,
                fillColor: Colors.white, // พื้นหลังสีขาว
                contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0), 
              ),
            ),
            SizedBox(height: 20),
            Text("Product Description"),
            SizedBox(height: 10,),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: "Enter Product Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: const Color.fromARGB(255, 236, 71, 214), width: 2.0),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              ),
            ),
            SizedBox(height: 10),
            Text("Product Price"),
            SizedBox(height: 10,),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Product Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: const Color.fromARGB(255, 236, 71, 214), width: 2.0),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: createProduct,
              child: Text("AddProduct"),
            ),
          ],
        ),
      ),
    );
  }
}
