import 'dart:js';

import 'package:dash_eats/view/cadastro.dart';
import 'package:flutter/material.dart';
import 'login.dart';

TextEditingController txtController = TextEditingController();
TextEditingController txtController2 = TextEditingController();
TextEditingController txtController3 = TextEditingController();
TextEditingController txtController4 = TextEditingController();

class cadastrarEmpresaView extends StatelessWidget {
  const cadastrarEmpresaView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEats(),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: InputField("E-mail ou Telefone", txtController),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("CNPJ: 000.000.000/0000-00", txtController2),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("Senha", txtController3),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("Nome da Empresa", txtController4),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Login(txtController, txtController2, txtController3,
                    txtController4))
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  Login(this.email, this.cnpj, this.nomeUsuario, this.senha);

  TextEditingController email = TextEditingController();
  TextEditingController cnpj = TextEditingController();
  TextEditingController nomeUsuario = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        onPressed: () {
          // Adicione a lógica de login aqui
          String emailString = email.text;
          String password = senha.text;
          String document = cnpj.text;
          String username = nomeUsuario.text;
          
          validarEmpresa(username, emailString, document, password, build);

        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50.0),
            ),
            minimumSize: Size(20, 60)),
        child: const Text(
          'Finalizar Cadastro',
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

  bool validarEmail(String email) {
    String padraoEmail = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(padraoEmail);
    return regex.hasMatch(email);
  }


  void validarEmpresa(String nome, String email, String cnpj, String senha,BuildContext build) {

              if (!validarEmail(email)) {
            mostrarAlertDialog(build, "Por favor, insira um e-mail válido.","Erro de email");
            return;
          }

          if(!RegExp(r'^[0-9]+$').hasMatch(cnpj)){
            mostrarAlertDialog(build, "Insira um documento valido","Erro de documento");
            return;
          }

          if (email.isEmpty ||
              senha.isEmpty ||
              cnpj.isEmpty ||
              nome.isEmpty) {
            mostrarAlertDialog(build, "Por favor, preencha todos os campos","Erro de validação");
            return;
          }
                Navigator.of(build)
    .pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
            mostrarAlertDialog(build, "entraremos em contato para validar e formalizar a criação", "Sucesso");
            return;



         
  }


