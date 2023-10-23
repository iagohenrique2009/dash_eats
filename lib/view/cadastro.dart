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

class dadosCadastro {
    String? email;
   String? senha ;
  String cpf;
   String  nome;
  dadosCadastro({required this.email, required this.senha,required this.cpf,required this.nome});
}
  List<dadosCadastro> dadosCadastrados = [];

class Login extends StatelessWidget {

  Login(this.email, this.cpf, this.nomeUsuario, this.senha);

  TextEditingController email = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController nomeUsuario = TextEditingController();
  TextEditingController senha = TextEditingController();


  void cadastrarUsuario(String nome, String email, String cpf, String senha) {
    dadosCadastro novoCadastro = dadosCadastro(email: email,senha: senha,cpf: cpf,nome: nome);
    dadosCadastrados.add(novoCadastro);
  }

  bool validarEmail(String email) {
    String padraoEmail = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(padraoEmail);
    return regex.hasMatch(email);
  }

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

  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        onPressed: () {
          // Adicione a lógica de login aqui
          String emailString = email.text;
          String password = senha.text;
          String document = cpf.text;
          String username = nomeUsuario.text;

          if (!validarEmail(emailString)) {
            _mostrarAlertDialog(build, "Por favor, insira um e-mail válido.");
            return;
          }

          if(!RegExp(r'^[0-9]+$').hasMatch(document)){
            _mostrarAlertDialog(build, "Insira um documento valido");
            return;
          }

          if (emailString.isEmpty ||
              password.isEmpty ||
              document.isEmpty ||
              username.isEmpty) {
            _mostrarAlertDialog(build, "Por favor, preencha todos os campos");
            return;
          }
          
          cadastrarUsuario(username, emailString, document, password);
          Navigator.pushNamed(build,"login");
          _mostrarAlertDialog(build, "Conta criada com sucesso");
          
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
