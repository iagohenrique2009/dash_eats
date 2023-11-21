


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_eats/view/cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginController{
   login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      mostrarAlertDialog(context, 'Usuário autenticado com sucesso.',"Sucesso");
      Navigator.pushNamed(context, 'inicio');
    }).catchError((e) {
      switch (e.code) {
        case 'user-not-found':
         mostrarAlertDialog(context, 'O usuario não foi encontrado',"Erro login");
          break;
        default:
          mostrarAlertDialog(context, 'ERRO: ${e.code.toString()}','Erro Login');
      }
    });
  }

    idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        usuario = resultado.docs[0].data()['nome'] ?? '';
        print(usuario);
      },
    );
    return usuario;
  }

   logout() {
    FirebaseAuth.instance.signOut();
  }

  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      mostrarAlertDialog(context, 'E-mail com mais informaçoes para trocar a senha foi enviado!.',"Recuperação de senha enviado com sucesso: ");
    } else {
      mostrarAlertDialog(context, 'Não foi possível enviar o e-mail',"Erro");
    }
  }

}