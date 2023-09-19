import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crear Usuario',
      home: UserForm(),
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Datos del usuario
      final userData = {
        'name': name,
        'email': email,
        'password': password,
      };

      print('Datos del usuario: $userData');
      // URL de la API donde deseas enviar los datos
      final body = json.encode(userData);
      final apiUrl =
          Uri.parse('http://10.0.2.2:8000/create'); // Reemplaza con tu URL real

      // Realiza la solicitud POST al servidor
      final response = await http.post(
        apiUrl,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      // Verifica si la solicitud fue exitosa
      if (response.statusCode == 200) {
        // La solicitud fue exitosa, puedes manejar la respuesta aquí si es necesario.
        print('Usuario creado exitosamente');
        // Puedes redirigir al usuario a otra página o mostrar un mensaje de éxito.
      } else {
        // Hubo un error en la solicitud, puedes manejarlo aquí.
        print('Error al crear el usuario');
        print('Código de estado: ${response.statusCode}');
        // Puedes mostrar un mensaje de error al usuario.
      }

      // Limpia los campos del formulario después de enviar los datos.
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el correo electrónico';
                  }
                  // Agrega validaciones adicionales para el correo electrónico si es necesario.
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa la contraseña';
                  }
                  // Agrega validaciones adicionales para la contraseña si es necesario.
                  return null;
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Crear Usuario'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
