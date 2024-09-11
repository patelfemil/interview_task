import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Formal Cloth', 'price': '\$7.99', 'image': 'https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', },
    {'name': 'Formal Cloth', 'price': '\$14.99', 'image': 'https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',},
    {'name': 'Formal Cloth', 'price': '3,69€', 'image': 'https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',},
    {'name': 'Formal Cloth', 'price': '\$7.99', 'image': 'https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Man Cloth'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3, // Adjust for height-width ratio
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              product: product,
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, String> product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product details screen
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product['image']!,
                  height: 100,
                ),
              ),
              SizedBox(height: 10),
              Text(
                product['price']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                product['name']!,
                style: TextStyle(fontSize: 14,color: Colors.black),
              ),
              SizedBox(height: 10,),
              Center(
                child: ElevatedButton(
                  child: Text('Add to cart',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      textStyle:
                      TextStyle(color: Colors.white)),
                 onPressed: () {

                 },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
