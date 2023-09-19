import 'package:flutter/material.dart';
import 'screens/views/clients_view.dart';
import 'screens/views/inventory_view.dart';
import 'screens/views/modify_customer_view.dart';
import 'screens/views/sell_register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scraphone Mari',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Venta de Celucos Chinos'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ClientsView(
                      viewTitle: 'Agregar Cliente Nuevo',
                    ),
                  ),
                );
              },
              child: Text('Agregar Cliente Nuevo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ModifyCustomerView(),
                  ),
                );
              },
              child: Text('Modificar Clientes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InventoryView(),
                  ),
                );
              },
              child: Text('Inventario'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SellRegisterView(),
                  ),
                );
              },
              child: Text('Registro de Ventas'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Agregar funcionalidad para el botón flotante
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
