import 'package:flutter/material.dart';
import './main.dart';

class ResourceWidget extends StatefulWidget {
  final Resource resource;
  final VoidCallback updateState;

  ResourceWidget({required this.resource, required this.updateState});

  @override
  _ResourceWidgetState createState() => _ResourceWidgetState();
}

class _ResourceWidgetState extends State<ResourceWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        margin: EdgeInsets.all(8),
        // padding: EdgeInsets.all(16),
        // Récupération de la couleur mise dans la liste de Ressource
        color: widget.resource.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.resource.name,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 2),
            Text(
              // Récupération de la description mise dans la liste de Ressource
              "(" + widget.resource.desc + ")",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              // Récupération de la couleur mise dans la liste de Ressource
              '${widget.resource.quantity}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                widget.updateState();
                setState(() {
                  widget.resource.quantity++;
                });
              },
              child: Text('Miner'),
            ),
          ],
        ),
      ),
    );
  }
}
