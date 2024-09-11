import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['image']!),
            SizedBox(height: 16),
            Text(
              product['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              product['price']!,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text('Product description here...'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add to cart logic
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
