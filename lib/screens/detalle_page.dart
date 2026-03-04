import 'package:flutter/material.dart';
import '../utils/colores.dart';

class DetallePage extends StatelessWidget {
  final String titulo;

  const DetallePage({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColores.azulPrincipal,
        title: Text(titulo),
      ),
      body: Center(
        child: Text(
          "Bienvenido a $titulo",
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
