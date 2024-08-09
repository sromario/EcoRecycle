

import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Padding(
        padding:  EdgeInsets.only(),
        child: Column(
        
        children: [
          // Ola , Fulano !
          Text(
            'Ola Fulano',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300
            )
            ),
                // Pontos de coleta 
          Text(
            'Pontos de Coleta',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300
            )
            ),
         
       
        
        // outras opcoes
        
        // <btn> Lembrete de Coleta
        
        
        /*
        
        <bottom navigator> 
        
        // Home 
        
        // My Recycle
        
        //  Logout
        
        
        */
        ],
        
        
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Sair',
            ),
        ],
        ),
    );
  }
}