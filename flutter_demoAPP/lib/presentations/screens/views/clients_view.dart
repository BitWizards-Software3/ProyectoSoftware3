import 'package:flutter/material.dart';

class ClientsView extends StatelessWidget {
  final String viewTitle;

  const ClientsView({Key? key, required this.viewTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Contenido de la vista de Clientes
            Text('Contenido de la vista de Clientes aquí'),
          ],
        ),
      ),
    );
  }
}
