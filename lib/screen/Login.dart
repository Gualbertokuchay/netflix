import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0, // Sin sombra debajo del AppBar
        leading: GestureDetector(
          onTap: () {
            // Acción cuando se toca el ícono
          },
          child: Image.asset("assets/netflixletras.png"), // Reemplaza con la ruta de tu ícono
        ),
      ),
      body: Container(
        color: Colors.black, // Fondo negro para todo el cuerpo
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Iniciar Sesión",
                style: TextStyle(
                  color: Colors.white, // Texto en blanco
                  fontSize: 28, // Tamaño grande
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Correo Electrónico",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2), // Fondo semi-transparente
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // Sin bordes
                      borderRadius: BorderRadius.circular(5), // Bordes redondeados
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Acción cuando se presiona el botón de inicio de sesión
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Bordes redondeados
                  ),
                  minimumSize: Size(300, 50), // Tamaño del botón
                ),
                child: Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    color: Colors.white, // Texto en blanco
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "¿Necesitas ayuda?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
