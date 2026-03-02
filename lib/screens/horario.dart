import 'package:flutter/material.dart';
import 'boton.dart';

class Horario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recursos disponibles',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MiCard(
                      imagen: 'assets/mesa.jpg',
                      titulo: 'Mesa de Ping Pong',
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: MiCard(
                      imagen: 'assets/guitarra.jpg',
                      titulo: 'Guitarra',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MiCard(
                      imagen: 'assets/cancha.jpg',
                      titulo: 'Cancha',
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: MiCard(
                      imagen: 'assets/ajedrez.jpg',
                      titulo: 'Ajedrez',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
