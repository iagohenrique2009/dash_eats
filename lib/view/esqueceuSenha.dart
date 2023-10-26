import 'package:dash_eats/view/cadastro.dart';
import 'package:dash_eats/view/login.dart';
import 'package:dash_eats/view/trocarsenha.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class esqueceuSenhaView extends StatelessWidget {
  const esqueceuSenhaView({super.key});
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
          'Insira o email usado na criação da conta abaixo para restaurar senha',
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
              child: InputField("E-mail ", txtController),
            ),
            Padding(
            padding: EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Login(txtController),
            )
          ],
        ),
      ));
  }
}

class Login extends StatelessWidget {
  Login(this.log);


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
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


void fazerLogin(BuildContext context){ 

          String username = log.text;
          String password = senha.text;

  dadosCadastro? usuario = dadosCadastrados.firstWhereOrNull(
      (u) => u.email == username,
    );
   if (usuario == null) {
      _mostrarAlertDialog(context, 'email não existe!');
      return;
    }
    else{
      Navigator.push(context,  MaterialPageRoute(
      builder: (context) => trocarSenhaView(email: 'Hello',),
    ));
    }
}

  TextEditingController log = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        onPressed: () {
          String username = log.text;
          String password = senha.text;
          fazerLogin(build);
          print('Username: $username');
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50.0), 
            ),
            minimumSize: Size(20, 50)),
        child: Text(
          'Restaurar a Senha',
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

class EsqueceuSenha extends StatelessWidget {
  EsqueceuSenha(this.email);

  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        onPressed: () {

          String emailString = email.text;

          print(
              'Email: $emailString');
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50.0),
            ),
            minimumSize: Size(20, 60)),
        child: Text(
          'Criar Conta',
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