import 'package:flutter/material.dart';
import '../utils/colores.dart';
import 'detalle_page.dart';
import 'horarios_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores.fondoGris,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔥 HEADER MODERNO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColores.azulPrincipal,
                      AppColores.azulPrincipal.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bienvenido 👋",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Gestiona tus recursos lúdicos fácilmente",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // 🔥 BOTONES SUPERIORES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _boton("Favoritos", Icons.favorite),
                  _boton("Historial", Icons.history),
                ],
              ),

              const SizedBox(height: 15),

              Center(child: _boton("Checkout", Icons.shopping_cart)),

              const SizedBox(height: 30),

              // 🔥 SERVICIOS
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Servicios",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _servicio("Música", "assets/images/musica.jpg"),
                    _servicio("Mesas", "assets/images/pingpong.jpg"),
                    _servicio("Canchas", "assets/images/cancha.jpg"),
                    _servicio("Pelotas", "assets/images/pelota.jpg"),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              // 🔥 RECURSOS MÁS USADOS
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Recursos más usados",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20),
                  children: [
                    _recurso("Guitarra", "assets/images/guitarra.jpg"),
                    const SizedBox(width: 20),
                    _recurso("Mesa ajedrez", "assets/images/ajedrez.jpg"),
                    const SizedBox(width: 20),
                    _recurso("Mesa ping pong", "assets/images/pingpong.jpg"),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColores.azulPrincipal,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Carrito",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }

  // 🔥 BOTONES MODERNOS
  Widget _boton(String texto, IconData icono) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColores.azulPrincipal,
        foregroundColor: Colors.white,
        fixedSize: const Size(150, 75),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetallePage(titulo: texto)),
        );
      },
      icon: Icon(icono),
      label: Text(texto),
    );
  }

  // 🔥 SERVICIOS MEJORADOS
  Widget _servicio(String texto, String imagen) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 6),
            ],
          ),
          child: CircleAvatar(radius: 35, backgroundImage: AssetImage(imagen)),
        ),
        const SizedBox(height: 6),
        Text(texto),
      ],
    );
  }

  // 🔥 RECURSO ULTRA MODERNO
  Widget _recurso(String titulo, String imagen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HorariosScreen(recurso: titulo)),
        );
      },
      child: Container(
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(imagen, fit: BoxFit.cover),

              // 🔥 OVERLAY DEGRADADO
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              Positioned(
                bottom: 15,
                left: 15,
                child: Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
