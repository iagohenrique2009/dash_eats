import 'package:dash_eats/view/cadastro.dart';
import 'package:dash_eats/view/login.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class trocarSenhaView extends StatelessWidget {
   final String email;
  const trocarSenhaView({super.key, required this.email});


  @override
  Widget build(BuildContext context) {
    TextEditingController txtController = TextEditingController();
    return
  Scaffold(
        appBar: AppBarDashEats(),
        body: Center(
        child: ListView(
          children: [
            Padding(padding:EdgeInsets.all(50),
            child: Text(
          'Insira a nova senha abaixo',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: InputField("Nova Senha ", txtController),
            ),
            Padding(
            padding: EdgeInsets.only(top: 80, left: 20, right: 20),
            child: trocarsenha(txtController,email),
            )
          ],
        ),
      ));
  }
}

class trocarsenha extends StatelessWidget {
  trocarsenha(this.senha,this.email);
  String email;


  void _mostrarAlertDialog(BuildContext context, String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro de validação'),
          content: Text(mensagem),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


void novaSenha(BuildContext context){ 

          String newPassword = senha.text;
          String username =email;


          int index = dadosCadastrados.indexWhere((element) => element.email!.contains("aa")); 

          print(index);
          dadosCadastrados[index].senha= newPassword;
          _mostrarAlertDialog(context, "Senha trocada com sucesso!");
          
}

  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        onPressed: () {
          String password = senha.text;
          novaSenha(build);
          print('Password: $password');
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50.0), 
            ),
            minimumSize: Size(20, 50)),
        child: Text(
          'Trocar a senha',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ));
  }
}
