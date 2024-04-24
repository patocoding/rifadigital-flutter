

import 'package:flutter/material.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String categoryId;
 const CategoryDetailsPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    // Aqui você pode buscar mais detalhes da categoria usando o categoryId
    return Scaffold(
      appBar: AppBar(title: const Text('Category Details')),
      body: Center(
        child: Text('Details of category $categoryId'),
      ),
    );
  }
}