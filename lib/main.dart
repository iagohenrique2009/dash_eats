import "package:dash_eats/view/cadastrarEmpresa.dart";
import "package:dash_eats/view/cadastro.dart";
import "package:dash_eats/view/esqueceuSenha.dart";
import "package:dash_eats/view/inicio.dart";
import "package:dash_eats/view/pesquisa.dart";
import "package:dash_eats/view/sobre.dart";
import "package:dash_eats/view/trocarsenha.dart";
import 'package:flutter/material.dart';
import "package:device_preview/device_preview.dart";
import 'package:collection/collection.dart';


import "view/login.dart";

void main() {
  //iniciar a execução do App
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (context) => loginView(),
          "cadastro": (context) => cadastroView(),
          "esqueceuSenha": (context) => esqueceuSenhaView(),
          'cadastrarEmpresa': (context) => cadastrarEmpresaView(),
          'inicio': (context) => inicioView(),
          'pesquisa': (context) => pesquisaView(),
          'sobre': (context) => sobreView()
        },
      ),
    ),
  );
}
