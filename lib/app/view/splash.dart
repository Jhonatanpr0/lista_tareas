
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Lista de Tareas'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('ASSETS'),
                  Text('IMAGENES'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
                'assets/images/logo.png',
              width: 400,
              height: 300,
            ),

          ],
        ),
      ),
    );
  }
}
