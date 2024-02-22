import 'package:flutter/material.dart';
import 'package:learn_getx/app/data/categroy_model.dart';

class CategoryShowView extends StatelessWidget {
  final Category category;

  CategoryShowView({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('category: ${category.category}'),
          ],
        ),
      ),
    );
  }
}
