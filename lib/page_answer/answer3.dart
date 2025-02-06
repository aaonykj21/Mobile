import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: Answer3(),
  ));
}

class Answer3 extends StatelessWidget {
  const Answer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Layout'),
        backgroundColor: const Color.fromARGB(255, 243, 185, 37),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 252, 251, 251),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: const Color.fromARGB(255, 206, 205, 205),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Category: Electronics',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          
         const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ ProductDetail(
            name: 'iPad',
            price: '25000',
            imageUrl: 'https://www.istudio.store/cdn/shop/files/iPad_Air_11_M2_WiFi_Blue_PDP_Image_Position_1b__en-US_58ccb803-96b1-4b0e-86e4-cf4a11824824.jpg?v=1716469837&width=1445',
          ),ProductDetail(
            name: 'Mackbook',
            price: '59000',
            imageUrl: 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mba13-midnight-select-202402?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1708367688034',
          )],
         ), SizedBox(height: 20,),
 
         const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ ProductDetail(
            name: 'Apple Watch',
            price: '12500',
            imageUrl: 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/s10-case-unselect-gallery-1-202409_FMT_WHH?wid=752&hei=720&fmt=p-jpg&qlt=80&.v=1724620929305',
          ),ProductDetail(
             name: 'Airpod',
            price: '6500',
            imageUrl: 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/airpods-pro-2-hero-select-202409_FMT_WHH?wid=750&hei=556&fmt=jpeg&qlt=90&.v=1724041668836',
          )],
         ),
        ],
      ),
    );
  }
}
 class ProductDetail extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  const ProductDetail({super.key, required this.name, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
        imageUrl,
        height: 150,
         width: 150,
         fit: BoxFit.cover,
      ),
      Text(name),
      Text("$price THB", style: TextStyle(color: Colors.green),)
      ],
      
      
    );
  }
}