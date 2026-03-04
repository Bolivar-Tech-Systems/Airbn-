import 'package:flutter/material.dart';
import 'screens/pantalla_login.dart'; // importa tu login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaLogin(),
    );
  }
}
