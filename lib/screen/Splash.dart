import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color: const  Color.fromARGB(255, 248, 236, 236), // cor escolhida
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/img00.svg', // Ícone
                  ),
                  const SizedBox(width: 8), // Espaço entre o ícone e o texto
                 
                ],
              ),
              const Text(
                    'EcoRecycle',
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.w900),
                ),

              const SizedBox(height: 20.0), // Espaço entre as linhas
              const CircularProgressIndicator(), // Indicador de progresso
            ],
          ),
        ),
      ),
    );
  }
}
