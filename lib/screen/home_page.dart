import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        // Ola Fulano
        Text('Ola Fulano', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),),
        // Pontos de Coleta
        SizedBox(height: 30,),
        Text('Pontos de Coleta', style: TextStyle(fontSize: 25),)

        /*
          row
          card: status- livre, text- Posto 7- Boa viagem, data - hoje , hora - 14h - 15

        */

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(

              )
            ],
        ),

        // Outras opcoes

        // btn lembrete de coleta

      ],
    ));
  }
}
