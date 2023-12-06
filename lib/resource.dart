import 'package:flutter/material.dart';
import './main.dart';

class ResourceWidget extends StatefulWidget {
  final Resource resource;
  final VoidCallback updateState;
    final List<Resource> resources;

  ResourceWidget({required this.resource, required this.updateState, required this.resources});

  @override
  _ResourceWidgetState createState() => _ResourceWidgetState();
}

class _ResourceWidgetState extends State<ResourceWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(8),
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
              "(" + widget.resource.desc + ")",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
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

                if (widget.resource.name == 'Minerai de fer brut' && widget.resource.quantity >= 1000 && widget.resources.any((resource) => resource.name == 'Minerai de cuivre brut' && resource.quantity >= 1000)) {
                  widget.resources.firstWhere((resource) => resource.name == 'Charbon').quantity = 1;
                }
              },
              child: Text('Miner'),
            ),
          ],
        ),
      ),
    );
  }
}
