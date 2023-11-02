import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'screen/HomeScreen.dart';



class LottieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Animation'),
      ),
      body: LottieAnimation(),
    );
  }
}

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({Key? key}) : super(key: key);

  @override
  _LottieAnimationState createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> with TickerProviderStateMixin { // Importa correctamente el mixin
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Establece la duración de la animación
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // La animación se ha completado, puedes cambiar de pantalla aquí
        _navigateToNewScreen();
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/Nettflix.json', // Cambia a tu ruta de archivo JSON local o URL
        controller: _controller,
        frameRate: FrameRate(60),
        fit: BoxFit.contain,
      ),
    );
  }

  void _navigateToNewScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

