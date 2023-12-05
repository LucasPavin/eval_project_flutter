import 'package:flutter/material.dart';
import './main.dart';
import './recipe.dart';

class InventoryPage extends StatelessWidget {
  final List<Recipe> producedRecipes;

  InventoryPage({required this.producedRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventaire'),
      ),
      body: ListView.builder(
        itemCount: producedRecipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(producedRecipes[index].name),
          );
        },
      ),
    );
  }
}