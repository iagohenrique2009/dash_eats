
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_eats/controller/login_controller.dart';
import 'package:dash_eats/view/cadastro.dart';
import 'package:dash_eats/view/editEnd.dart';
import 'package:flutter/material.dart';

class perfil_controller{


   void atualizar(context, nome) async  {
    var id =await loginController().usuarioCollection("usuarios");
    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .update({"nome": nome})
        .then((value) => mostrarAlertDialog(context, 'Nome atualizado com sucesso',"Sucesso"))
        .catchError(
            (e) => mostrarAlertDialog(context, 'Não foi possível atualizar o nome.',"Erro"))
        .whenComplete(() => Navigator.pop(context));
  }

  
   void atualizarEndereco(context, rua,numero,bairro,complemento) async  {
    var id =await loginController().usuarioCollection("enderecos");
    print(id);
    FirebaseFirestore.instance
        .collection('enderecos')
        .doc(id)
        .update({'rua': rua,
          'numero':numero ,
          'bairro':bairro,
          "complemento":complemento })
        .then((value) => mostrarAlertDialog(context, 'Endereco atualizado com sucesso',"Sucesso"))
        .catchError(
            (e) => mostrarAlertDialog(context, 'Não foi possível atualizar o endereco.',"Erro"))
        .whenComplete(() => Navigator.pop(context));
  }

  void  endereco(context, rua, numero, bairro,complemento,id) async{
      FirebaseFirestore.instance.collection('enderecos').add(
        {
          'uid': id ,
          'rua': rua ?? "",
          'numero':numero ?? "",
          'bairro':bairro ?? "",
          "complemento":complemento ?? ""
        },
      );
    
}
}