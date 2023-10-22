import 'package:flutter/material.dart';
import 'login.dart';

TextEditingController txtController = TextEditingController();
TextEditingController txtController2 = TextEditingController();
TextEditingController txtController3 = TextEditingController();
TextEditingController txtController4 = TextEditingController();

class cadastroView extends StatelessWidget {
  const cadastroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEats(),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: InputField("E-mail", txtController),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("CPF: 000.000.000-00", txtController2),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("Nome de usuario", txtController3),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("Senha", txtController4),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Login(txtController, txtController2, txtController3,
                  txtController4),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: BotaoLoginRedes(
                  "Continuar com Google", "lib/assets/google.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: BotaoLoginRedes(
                  "Continuar com Facebook", "lib/assets/facebook.png"),
            ),
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  Login(this.email, this.cpf, this.nomeUsuario, this.senha);

  TextEditingController email = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController nomeUsuario = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        onPressed: () {
          // Adicione a lógica de login aqui
          String emailString = email.text;
          String password = senha.text;
          String document = cpf.text;
          String username = nomeUsuario.text;
          // Faça algo com o nome de usuário e senha, como validar ou autenticar
          print(
              'Email: $emailString, Password: $password, Nome de usuario: $username, CPF: $document ');
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50.0), // Define a forma da borda
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
