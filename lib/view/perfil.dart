

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dash_eats/view/login.dart';
import 'package:flutter/material.dart';


class perfilView extends StatelessWidget {
  const perfilView({super.key});
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEats(),
      body: Center(
        child: Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
          Positioned(
            left: 40,
            top: 50,
            child: Container(
              width: 100,
              height: 100,
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 150,
            top: 90,
            child: SizedBox(
              width: 171,
              height: 17,
              child: Text(
                'user_name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),

          Positioned(
            left: 53,
            top: 296,
            child: SizedBox(
              width: 252,
              child: Text(
                'Endereço:\nRua -   \nNúmero -   \nBairro -  \nComplemento -',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 540,
            child: Container(
              width: 244,
              height: 36,
              child: Stack(
                children: [
                    const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: 
                            BorderRadius.circular(50.0)
                        ),
                        minimumSize: Size(160, 40)
                        ),
                        
                        onPressed: () {
                           Navigator.pushNamed(context, 'editEnd');
                        },
                        child: const Text('Editar Endereço'),      
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 580,
            child: Container(
              width: 244,
              height: 36,
              child: Stack(
                children: [
                    const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: 
                            BorderRadius.circular(50.0)
                        ),
                        minimumSize: Size(160, 40)
                        ),
                        onPressed: () {
                            Navigator.pushNamed(context, 'editRest');
                        },
                        child: const Text('Editar Restrições'),      
                  ),
                ],
              ),
            ),
          ),
          
        ],
          ),
        ),
      )
    );
  }
}
