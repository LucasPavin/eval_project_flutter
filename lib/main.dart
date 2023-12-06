import 'package:flutter/material.dart';
import './recipe.dart';
import './resource.dart';

void main() {
  runApp(MyApp());
}

class Resource {
  String name;
  int quantity;
  String desc;
  Color color;

  Resource(this.name, this.quantity, this.desc, this.color);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evaluation Flutter Project "Clicker Game"',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Liste des différentes ressources
  List<Resource> resources = [
    Resource('Bois', 0, "Du bois brut", Color(0xFF967969)),
    Resource('Minerai de fer brut', 0, "Du minerai de fer brut", Color(0xFFced4da)),
    Resource('Minerai de cuivre brut', 0, "Du minerai de cuivre brut Charbon", Color(0xffd9480f)),
    Resource('Charbon', 0, 'Du minerai de charbon', Color(0xFF000000)),
  ];

  bool ressourceAreOk(Recipe recipe) {
    for (var entry in recipe.cost.entries) {
      String resourceName = entry.key;
      int requiredQuantity = entry.value;

      Resource requiredResource = resources.firstWhere((resource) => resource.name == resourceName);

      if (requiredResource.quantity < requiredQuantity) {
        return false;
      }
    }
    return true;
  }

  void deductResources(Recipe recipe) {
    for (var entry in recipe.cost.entries) {
      String resourceName = entry.key;
      int requiredQuantity = entry.value;

      Resource requiredResource = resources.firstWhere((resource) => resource.name == resourceName);
      requiredResource.quantity -= requiredQuantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ressources'),
        actions: [
          IconButton(
            icon: Row(
              children: [  // Icône Google
                Text('Les recettes'),
                SizedBox(width: 10),
                Icon(Icons.food_bank_sharp),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipePage()),
              );
            },
          ),
          IconButton(
            icon: Row(
              children: [  // Icône Google
                Text('Inventaire'),
                SizedBox(width: 10),
                Icon(Icons.inventory),
              ],
            ),

            // On redirige l'utilisateur vers la page des innventaires.

            onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => InventoryPage()),
            //   );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return ResourceWidget(resource: resources[index], updateState: _updateState, resources: resources);
        },
        itemCount: resources.length,
      ),
    );
  }

  void _updateState() {
    setState(() {

    });
  }
}


