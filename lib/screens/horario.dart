import 'package:flutter/material.dart';
import 'horarios_screen.dart';

class Horario extends StatelessWidget {
  const Horario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PANTALLA NUEVA FUNCIONA'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            recursoBoton(context, 'Mesa de Ping Pong', 'assets/mesa.jpg'),
            recursoBoton(context, 'Guitarra', 'assets/guitarra.jpg'),
            recursoBoton(context, 'Cancha', 'assets/cancha.jpg'),
            recursoBoton(context, 'Ajedrez', 'assets/ajedrez.jpg'),
          ],
        ),
      ),
    );
  }

  Widget recursoBoton(BuildContext context, String titulo, String imagen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HorariosScreen(recurso: titulo),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagen, fit: BoxFit.cover),
            Container(color: Colors.black.withOpacity(0.4)),
            Center(
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
