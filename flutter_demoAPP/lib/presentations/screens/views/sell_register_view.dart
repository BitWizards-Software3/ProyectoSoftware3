import 'package:flutter/material.dart';

class SellRegisterView extends StatelessWidget {
  const SellRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Ventas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Contenido de la vista de Registro de Ventas
            Text('Contenido de la vista de Registro de Ventas aquí'),
          ],
        ),
      ),
    );
  }
}
