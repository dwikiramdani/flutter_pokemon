import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: CachedNetworkImage(
                height: 150,
                width: 150,
                fit: BoxFit.cover,
                imageUrl: product.imageUrl,
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
              // child: Image.network(
              //   product.imageUrl, // Replace with the URL or path to your product image
              //   width: 150,
              //   height: 150,
              //   fit: BoxFit.cover,
              // ),
            ),

            SizedBox(height: 16),

            // Product Name
            Text(
              product.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            // Product Description
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(height: 8),

            // Product Price
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}', // Assuming the price is a double
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),

            // Add more widgets for other product details as needed
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}