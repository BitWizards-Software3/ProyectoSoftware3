import 'package:flutter/material.dart';

class ModifyCustomerView extends StatelessWidget {
  const ModifyCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Cliente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Contenido de la vista de Modificar Cliente
            Text('Contenido de la vista de Modificar Cliente aquí'),
          ],
        ),
      ),
    );
  }
}
