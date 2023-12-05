import 'package:flutter/material.dart';
import './main.dart';

class Recipe {
  String name;
  Map<String, int> cost; // Utilisation d'une Map pour stocker le coût
  String gameplay;
  String type;
  String description;

  Recipe(this.name, this.cost, this.gameplay, this.type, this.description);
}


class RecipePage extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe('Hache', {"Bois": 2, "Minerai de fer brut": 2}, 'Récolter le bois 3 par 3', "Outils", 'Description de la recette 1'),
    Recipe('Hache', {"Bois": 2, "Minerai de fer brut": 2}, 'Récolter le bois 3 par 3', "Outils", 'Description de la recette 1'),
    Recipe('Hache', {"Bois": 2, "Iron rod": 2}, 'Récolter le bois 3 par 3', "Outils", 'Description de la recette 1'),
    Recipe('Hache', {"Bois": 2, "Iron rod": 2}, 'Récolter le bois 3 par 3', "Outils", 'Description de la recette 1'),
    Recipe('Hache', {"Bois": 2, "Iron rod": 2}, 'Récolter le bois 3 par 3', "Outils", 'Description de la recette 1'),

    // Ajoutez d'autres recettes selon vos besoins
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recettes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeWidget(recipe: recipes[index]);
        },
      ),
    );
  }
}


class RecipeWidget extends StatelessWidget {
  final Recipe recipe;

  RecipeWidget({required this.recipe});

  @override
  Widget build(BuildContext context) {
    HomePageState ? homePageState = context.findAncestorStateOfType<HomePageState>();

    bool areResourcesAvailable = homePageState?.ressourceAreOk(recipe) ?? false;

    return ListTile(
      subtitle: Column(
        children: [
          SizedBox(height: 2),
          Text(
            recipe.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Type : ${recipe.type}'),
          Text('Description : ${recipe.description}'),
          Text('Coût : ${_formatCost(recipe.cost)}'),
          ElevatedButton(
            onPressed: areResourcesAvailable
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Produit ajouté à l\'inventaire'),
                    ));
                    homePageState?.deductResources(recipe);
                  }
                : null,
            child: Text('Produire'),
          ),
        ],
      ),
    );
  }

  String _formatCost(Map<String, int>? cost) {
    // Handle null cost gracefully
    if (cost == null) {
      return 'N/A';
    }

    // Convertit la Map en une liste de chaînes "nom x quantité" et les joint avec une virgule
    return cost.entries.map((entry) => '${entry.key} x ${entry.value}').join(', ');
  }
}