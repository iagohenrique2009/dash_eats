

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_eats/view/cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class cadastroController{

 criarConta(context, nome, email, senha,cpf) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    )
        .then((resultado) {
      //Armazenar o NOME do usuário no Firestore
      FirebaseFirestore.instance.collection('usuarios').add(
        {
          'uid': resultado.user!.uid,
          'nome': nome,
          'cpf':cpf,
          'email':email
        },
      );

      mostrarAlertDialog(context, 'Usuário criado com sucesso.',"Sucesso");
      Navigator.pop(context);

    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          mostrarAlertDialog(context, 'O email já foi cadastrado.',"Erro no cadastro");
          break;
        case 'invalid-email':
          mostrarAlertDialog(context, 'O email informado é inválido.',"Erro no cadastro");
          break;
        default:
           mostrarAlertDialog(context, 'ERRO: ${e.code.toString()}',"Erro no cadastro");
      }
    });
  }

}