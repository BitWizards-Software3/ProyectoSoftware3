import 'package:flutter/material.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Contenido de la vista de Inventario
            Text('Contenido de la vista de Inventario aquí'),
          ],
        ),
      ),
    );
  }
}
