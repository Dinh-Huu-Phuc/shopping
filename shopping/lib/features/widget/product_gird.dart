import 'package:flutter/material.dart';
import 'package:shopping/models/product.dart';

import '../product_details_screen.dart';
import 'product_card.dart';

class ProductGird extends StatelessWidget {
  const ProductGird({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder:(context,index){
        final product = products[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                product: product,
              ),
            ),
          ),
          child: ProductCard(
            product: product
          ),
        );
      }
    );
  }
}