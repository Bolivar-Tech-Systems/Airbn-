import 'package:flutter/material.dart';

class ServicioItem extends StatelessWidget {
  final String texto;
  final String imageUrl;

  const ServicioItem({super.key, required this.texto, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 35, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(height: 6),
        Text(texto),
      ],
    );
  }
}
