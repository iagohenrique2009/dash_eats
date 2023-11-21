import "package:dash_eats/firebase_options.dart";
import "package:dash_eats/view/cadastrarEmpresa.dart";
import "package:dash_eats/view/cadastro.dart";
import "package:dash_eats/view/carrinho.dart";
import "package:dash_eats/view/editEnd.dart";
import "package:dash_eats/view/editRest.dart";
import "package:dash_eats/view/empresa.dart";
import "package:dash_eats/view/esqueceuSenha.dart";
import "package:dash_eats/view/inicio.dart";
import "package:dash_eats/view/perfil.dart";
import "package:dash_eats/view/pesquisa.dart";
import "package:dash_eats/view/produto.dart";
import "package:dash_eats/view/sobre.dart";
import "package:dash_eats/view/trocarsenha.dart";
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import "package:device_preview/device_preview.dart";
import 'package:collection/collection.dart';


import "view/login.dart";

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
          
          'perfil': (context) => perfilView(),
          'editEnd': (context) => editEndView(),
          'editRest': (context) => editRestView(),
          'pesquisa': (context) => pesquisaView(),
          'sobre': (context) => sobreView(),
          'carrinho':(context) => carrinhoView(),
          'produto':(context) => produtoView(valor: 0,nome: "",imagem: 'https://media.istockphoto.com/id/1309352410/pt/foto/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=2048x2048&w=is&k=20&c=vOX__q55jfX2CvNxeVtm5x3K57uh49im62WtJDz7eBA='),
          'empresa':(context) => empresaView(),
        },
      ),
    ),
  );
}