import 'package:flutter/material.dart';
import '../utils/colores.dart';

class HorariosScreen extends StatefulWidget {
  final String recurso;

  const HorariosScreen({super.key, required this.recurso});

  @override
  State<HorariosScreen> createState() => _HorariosScreenState();
}

class _HorariosScreenState extends State<HorariosScreen> {
  final List<String> horarios = [
    "8:00 AM - 9:00 AM",
    "9:00 AM - 10:00 AM",
    "10:00 AM - 11:00 AM",
    "2:00 PM - 3:00 PM",
    "3:00 PM - 4:00 PM",
    "4:00 PM - 5:00 PM",
  ];

  final Set<String> reservados = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores.fondoGris,
      appBar: AppBar(
        backgroundColor: AppColores.azulPrincipal,
        title: Text(widget.recurso),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: horarios.length,
          itemBuilder: (context, index) {
            final horario = horarios[index];
            final estaReservado = reservados.contains(horario);

            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: estaReservado
                      ? Colors.grey
                      : AppColores.azulPrincipal,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: estaReservado
                    ? null
                    : () {
                        setState(() {
                          reservados.add(horario);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Reservaste $horario para ${widget.recurso}",
                            ),
                          ),
                        );
                      },
                child: Text(
                  estaReservado ? "$horario (Reservado)" : horario,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
