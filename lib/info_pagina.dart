import 'package:flutter/material.dart';

class InfoPagina extends StatelessWidget {
  final String titulo;

  const InfoPagina({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo), backgroundColor: Colors.blueAccent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Estos son los horarios disponibles de: $titulo',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                botonCuadrado(context, "9:00-10:00 AM"),
                const SizedBox(width: 50),
                botonCuadrado(context, "10:00-11:00 AM"),
                const SizedBox(width: 50),
                botonCuadrado(context, "11:00-12:00 PM"),
                const SizedBox(width: 50),
                botonCuadrado(context, "2:00-3:00 PM"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget botonCuadrado(BuildContext context, String texto) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(145, 80),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Horario seleccionado")));
    },
    child: Text(texto),
  );
}
