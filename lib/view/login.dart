
import 'package:collection/collection.dart';
import 'package:dash_eats/view/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class loginView extends StatelessWidget {
  const loginView({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isChecked = false;
    TextEditingController txtController = TextEditingController();
    TextEditingController txtController2 = TextEditingController();

    return Scaffold(
      appBar: AppBarDashEats(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: InputField("E-mail", txtController),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: InputField("Senha", txtController2),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Login(txtController, txtController2)),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: CheckBoxConectado()),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: TextoUnderlineHyperlink(
                    "Ainda não é usuario?", "cadastro")),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: TextoUnderlineHyperlink(
                    "Esqueceu a senha?", "esqueceuSenha")),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: BotaoLoginRedes(
                  "Continuar com Google", "lib/assets/google.png"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: BotaoLoginRedes(
                  "Continuar com Facebook", "lib/assets/facebook.png"),
            ),
            Padding(
              padding: EdgeInsets.only(left:80,right: 80,top:50),
              child: TextoUnderlineHyperlink(
                  "Cadastrar Empresa", "cadastrarEmpresa"),
            )
          ],
        ),
      ),
    );
  }
}

AppBar AppBarDashEats() {
  return AppBar(
    title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          child: Text('DashEats',
              style: GoogleFonts.getFont(
                'Inter',
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )))
    ]),
    backgroundColor: Color.fromARGB(255, 207, 10, 10),
    iconTheme: IconThemeData(color: Colors.black),
  );
}

class TextoUnderlineHyperlink extends StatelessWidget {
  TextoUnderlineHyperlink(this.txt, this.view);

  String txt;

  String view;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, view);
      },
      child: RichText(
        text: TextSpan(
          text: txt,
          style: TextStyle(
            decoration: TextDecoration.underline,
            decorationColor:
                const Color.fromARGB(255, 0, 0, 0), 
            decorationThickness: 1.0, 
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
class Login extends StatelessWidget {
  Login(this.log, this.senha);


void fazerLogin(BuildContext context){ 

          String username = log.text;
          String password = senha.text;

  dadosCadastro? usuario = dadosCadastrados.firstWhereOrNull(
      (u) => u.email == username && u.senha == password,
    );
   if (usuario == null) {
      mostrarAlertDialog(context, 'email ou senha incorretos!',"Erro de Login");
      return;
    }
    else{
      Navigator.pushNamed(context, 'inicio');
    }
}



  TextEditingController log = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext build) {
    return ElevatedButton(
        onPressed: () {
          // Adicione a lógica de login aqui
          String username = log.text;
          String password = senha.text;
          fazerLogin(build);
          print('Username: $username, Password: $password');
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50.0), 
            ),
            minimumSize: Size(20, 50)),
        child: Text(
          'Login',
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

class BotaoLoginRedes extends StatelessWidget {
  BotaoLoginRedes(this.txt, this.asset);

  String txt;
  String asset;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          minimumSize: Size(20, 60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Image.asset(
              asset,
              height: 40,
            )
          ],
        ));
  }
}

class InputField extends StatelessWidget {
  InputField(this.texto, this.textoControle);

  TextEditingController textoControle = TextEditingController();
  final String texto;

  @override
  Widget build(BuildContext build) {
    return Opacity(
      opacity: 0.4,
      child: TextFormField(
        controller: textoControle,
        decoration: InputDecoration(
          hintText: texto,
          filled: true,
          fillColor: Color(0xFFD9D9D9),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.black, 
              width: 2.0,
            ),
          ),
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}

//// checkbox
class CheckBoxConectado extends StatefulWidget {
  @override
  CheckBoxConectadoState createState() => CheckBoxConectadoState();
}

class CheckBoxConectadoState extends State<CheckBoxConectado> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Text('Mantenha-me conectado'),
      ],
    );
  }
}
