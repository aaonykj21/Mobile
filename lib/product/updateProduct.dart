import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditProductScreen extends StatefulWidget {
  final String productId;
  final String productName;
  final String productDescription;
  final double productPrice;

  EditProductScreen({ //การรับข้อมูลจากหน้าอื่น
    required this.productId, //เมื่อ EditProductScreen ถูกสร้างขึ้น จะมีการรับค่า 4 ตัวแปรผ่าน Constructor คือ productId, productName, productDescription, และ productPrice. ข้อมูลเหล่านี้จะถูกใช้ในการตั้งค่าพื้นฐานของฟอร์มที่ให้ผู้ใช้แก้ไข.
    required this.productName,
    required this.productDescription,
    required this.productPrice,
  });

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController nameController = TextEditingController(); //ควบคุมการกรอกข้อมูลใน TextField ที่เกี่ยวข้องกับชื่อสินค้า, คำอธิบายสินค้า, และราคาสินค้า.
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void initState() { //ในฟังก์ชัน initState(), ค่าเริ่มต้นที่ถูกส่งมาจากหน้าก่อนจะถูกตั้งใน TextEditingController เพื่อให้ TextField แสดงค่าที่มีอยู่แล้ว. เช่น ค่าเริ่มต้นของชื่อ, คำอธิบาย, และราคา.
    super.initState();
    nameController.text = widget.productName;
    descriptionController.text = widget.productDescription;
    priceController.text = widget.productPrice.toString();
  }

  Future<void> updateProduct() async {
    try {
      var response = await http.put(
        Uri.parse("http://10.0.2.2:3000/products/${widget.productId}"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": nameController.text,
          "description": descriptionController.text,
          "price": double.tryParse(priceController.text) ?? 0.0,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Product updated successfully!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.pop(context, true); 
      } else {
        throw Exception("Failed to update product");
      }
    } catch (e) {
      print(e);
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
        title: Text("Edit Product"),
        backgroundColor: const Color.fromARGB(255, 147, 201, 242),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Product Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 236, 71, 214), 
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, 
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: "Product Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 236, 71, 214), 
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, 
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Product Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 236, 71, 214), 
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, 
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateProduct,
              child: Text("Update Product"),
            ),
          ],
        ),
      ),
    );
  }
}
