import 'dart:io';

import 'package:dash_eats/view/inicio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class sobreView extends StatelessWidget {
    const sobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEatsComDrawer(context),
      endDrawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('DashEats',
              style: GoogleFonts.getFont(
                'Inter',
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
            SizedBox(height: 20.0),
            Title(color: Colors.black, child: Text("Tema:", style: TextStyle(fontSize: 20.0))),
            Text(
              'DASH EATS: APLICATIVO DE PEDIDOS DE COMIDA PARA BARES E RESTAURANTES',
              style: TextStyle(fontSize: 20.0, ),
            ),
            
            SizedBox(height: 20.0),
            Title(color: Colors.black, child: Text("Objetivo:", style: TextStyle(fontSize: 16.0))),
            Text(
              'A criação de um aplicativo de entrega de comida na cidade de São Simão, e entender como esse serviço impacta a comunidade local em termos de conveniência.um aplicativo de delivery para uma cidade pequena do interior de São Paulo facilitando assim o contato entre pequenos negócios e clientes.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Versão 1.0.0',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Column(
              children: [
                  Text("Iago Henrique Marques De Oliveira"),
                  Image.asset('lib/assets/iago.png',
                  height: 150.0,
          fit: BoxFit.cover,
                  ),
             SizedBox(height: 10.0),
            Text("Iury Henrique Monteiro"),
            Image.asset('lib/assets/iury.png',
            height:150.0,
          fit: BoxFit.cover,
            )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
