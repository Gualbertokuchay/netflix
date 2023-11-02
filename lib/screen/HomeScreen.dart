import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/Login.dart';
import 'package:netflix_clone/screen/Pantalla.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  final _pageIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            // Acción cuando se toca el ícono
          },
          child: Image.asset("assets/netflix.png"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                // Acción cuando se toca "Privacidad"
                _navigateToPrivacyPage(context);
              },
              child: Text(
                "Privacidad",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Acción cuando se toca "Iniciar Sesión"
              _navigateToLoginScreen(context);
            },
            child: Text(
              "Iniciar Sesión",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            // Eliminamos la animación onPageChanged
            children: [
              CustomPage(
                backgroundImage: "assets/Elite.jpeg",
              ),
              CustomPage(
                backgroundImage: "assets/Elite.jpeg",
              ),
              CustomPage(
                backgroundImage: "assets/Elite.jpeg",
              ),
              CustomPage(
                backgroundImage: "assets/Elite.jpeg",
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pantantalla()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "EMPEZAR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: CirclePageIndicator(
              currentPageNotifier: _pageIndexNotifier,
              itemCount: 4,
              selectedDotColor: Colors.white,
              dotColor: Colors.grey,
              size: 12.0,
              // Eliminamos la animación onPageSelected
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPrivacyPage(BuildContext context) async {
    final url =
        'https://help.netflix.com/legal/privacy?netflixsource=android&fromApp=true';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('No se pudo abrir la URL: $url');
    }
  }

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}

class CustomPage extends StatelessWidget {
  final String backgroundImage;

  const CustomPage({
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(""),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
