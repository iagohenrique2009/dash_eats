import 'package:dash_eats/view/login.dart';
import 'package:dash_eats/view/perfil.dart';
import 'package:flutter/material.dart';

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
              child: InputField("Nome", txtController3),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("Senha", txtController4),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: CadastroUsuario(txtController, txtController2, txtController3,
                  txtController4),
            )
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

class CadastroUsuario extends StatelessWidget {

  CadastroUsuario(this.email, this.cpf, this.nomeUsuario, this.senha);

  TextEditingController email = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController nomeUsuario = TextEditingController();
  TextEditingController senha = TextEditingController();


  void cadastrarUsuario(String nome, String email, String cpf, String senha) {
    dadosCadastro novoCadastro = dadosCadastro(email: email,senha: senha,cpf: cpf,nome: nome);
    controllerNome.text =novoCadastro.nome;
    dadosCadastrados.add(novoCadastro);
  }

  bool validarEmail(String email) {
    String padraoEmail = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(padraoEmail);
    return regex.hasMatch(email);
  }

 

  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        onPressed: () {
          String emailString = email.text;
          String password = senha.text;
          String document = cpf.text;
          String username = nomeUsuario.text;

          if (!validarEmail(emailString)) {
            mostrarAlertDialog(build, "Por favor, insira um e-mail válido.","Erro de email");
            return;
          }

          if(!RegExp(r'^[0-9]+$').hasMatch(document)){
            mostrarAlertDialog(build, "Insira um documento valido","Erro de documento");
            return;
          }

          if (emailString.isEmpty ||
              password.isEmpty ||
              document.isEmpty ||
              username.isEmpty) {
            mostrarAlertDialog(build, "Por favor, preencha todos os campos","Erro de validação");
            return;
          }
          
          cadastrarUsuario(username, emailString, document, password);
          Navigator.pushNamed(build,"login");
          mostrarAlertDialog(build, "Conta criada com sucesso","Sucesso");
          
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
 void mostrarAlertDialog(BuildContext context, String mensagem,String titulo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
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
