import 'dart:convert';
import 'package:demoproject/product/createProduct.dart';
import 'package:demoproject/product/updateProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<dynamic> products = []; //products เป็น List ของสินค้า ที่มาจาก API

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('http://10.0.2.2:3000/products')); //ใช้ http.get() เพื่อเรียก API
      if (response.statusCode == 200) { //ถ้าสำเร็จ (statusCode == 200) → แปลง JSON เป็น List<dynamic>
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() { //ใช้ setState() เพื่ออัปเดต products และรีเฟรช UI
          products = jsonList;
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) { //ถ้าเกิดข้อผิดพลาด → catch (e) จะจับ error และพิมพ์ออกมาใน console
      print(e);
    }
  }

  @override
  void initState() {
    super.initState(); //initState() → ทำงานแค่ ครั้งเดียวตอนเปิดหน้า เพื่อโหลดข้อมูลสินค้า
    fetchData(); // เรียกเมื่อเริ่มต้นหน้า
  }

  

  Future<void> deleteProduct({dynamic idDelete = "44b7"}) async {
    try {
      var response = await http.delete(Uri.parse("http://10.0.2.2:3000/products/$idDelete")); //ใช้ http.delete() เพื่อลบสินค้าตาม id
      if (response.statusCode == 200) { //ถ้าสำเร็จ (statusCode == 200) → แสดง SnackBar แจ้งว่าลบสำเร็จ
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Deleted successfully!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        throw Exception("Failed to delete products"); //ถ้าลบไม่สำเร็จ → throw Exception()
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        backgroundColor: const Color.fromARGB(255, 147, 201, 242),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];

          return ListTile(
            leading: Text(product['id'].toString()), //leading: แสดง ID ของสินค้า
            title: Text(product['name']), //title: ชื่อสินค้า
            subtitle: Text(product['description']), //subtitle: คำอธิบายสินค้า
            trailing: Row( //trailing: แสดงราคา พร้อมปุ่ม แก้ไข (edit) และ ลบ (delete) (trailing: ใช้สำหรับแสดง Widget ที่อยู่ทางขวาสุด ของรายการแต่ละอัน)
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${product['price']} ฿",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () async {
                    bool? isUpdated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProductScreen(
                          productId: product['id'].toString(),
                          productName: product['name'],
                          productDescription: product['description'],
                          productPrice: product['price'],
                        ),
                      ),
                    );

                    if (isUpdated == true) {
                      await fetchData();
                    }
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 24,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await deleteProduct(idDelete: product['id']); //กดปุ่ม delete → เรียก deleteProduct()
                    await fetchData(); //ถ้าลบสำเร็จ → โหลดข้อมูลใหม่ (fetchData())
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isProductAdded = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()), //กดปุ่ม + → ไปหน้า AddProductScreen
          );

          if (isProductAdded == true) {
            await fetchData(); //ถ้าเพิ่มสินค้าสำเร็จ (isProductAdded == true) → โหลดข้อมูลใหม่ (fetchData())
          }
        },
        backgroundColor: const Color.fromARGB(255, 248, 156, 223),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
