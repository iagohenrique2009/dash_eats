import 'package:flutter/material.dart';



class esqueceuSenhaView extends StatelessWidget {
  const esqueceuSenhaView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter'),
        ),
        body: Center(
          child: Text('senha, World!'),
        ),
      ),
    );
  }
}
