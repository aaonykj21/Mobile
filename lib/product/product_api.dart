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
  List<dynamic> products = [];

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('http://10.0.2.2:8001/products'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          products = jsonList;
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // เรียกเมื่อเริ่มต้นหน้า
  }

  

  Future<void> deleteProduct({dynamic idDelete = "44b7"}) async {
    try {
      var response = await http
          .delete(Uri.parse("http://10.0.2.2:8001/products/$idDelete"));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Deleted successfully!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        throw Exception("Failed to delete products");
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
            leading: Text(product['id'].toString()),
            title: Text(product['name']),
            subtitle: Text(product['description']),
            trailing: Row(
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
                    await deleteProduct(idDelete: product['id']);
                    await fetchData();
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
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          );

          if (isProductAdded == true) {
            await fetchData();
          }
        },
        backgroundColor: const Color.fromARGB(255, 248, 156, 223),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
