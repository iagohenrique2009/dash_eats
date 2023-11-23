// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_eats/controller/login_controller.dart';
import 'package:dash_eats/view/inicio.dart';
import 'package:dash_eats/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker_web/image_picker_web.dart';

class enderecoClass {
    String? rua;
    String? bairro;
    String? numero;
    String? complemento;
    enderecoClass({required this.rua, required this.bairro, required this.complemento, required this.numero} );
}
enderecoClass enderecoValores = new enderecoClass(rua: "", bairro: "", complemento: "", numero: "");

class perfilView extends StatelessWidget {
  const perfilView({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBarDashEatsComDrawer(context),
      endDrawer: AppDrawer(),
      body: 
      StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('enderecos')
            .where("uid", isEqualTo: loginController().idUsuario())
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.docs.length > 0) {
              
              final endereco = snapshot.data!.docs[0];
              ListView(
                children: [
                  Center(
                    child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: CustomWidget(),
                  )),
              Padding(
              padding:  EdgeInsets.only(top:50,left: 40,bottom: 30),
              child: endereco(),
            ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: editar("Editar Endereço", "editEnd"),
                ),
                  editar("Editar Restrições", "editRest"),
              ],
            ),
          ),
        ],
      );

            }
          }
          return Text("");
        }
        ),
      
      
      bottomNavigationBar: rodape(),
    );
  }
}

String nome(texto){

    if(texto!=""){
      return texto;
    }

    return controllerNome.text;
}

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
              child:  ClipRRect(
        borderRadius:BorderRadius.circular(100),
        child: imagem(),)
              ),
                    ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                minimumSize: Size(160, 40)),
            onPressed: () {
              _getImgFile(context);
            },
            child: Text("Trocar Avatar"),
          ),
               Padding(
                 padding: const EdgeInsets.only(top:40),
                 child: Text(
                  nome(controllerNome.text),
                  style: TextStyle(fontSize: 25.0),
                             ),
               ),
              editarNome('Atualizar Nome', 'perfil'),
              
            ],
          ),

    );
  }
}
class imagem extends StatelessWidget{

Widget build(BuildContext context){
 if (_imageInfo != null) {
        return Image.memory(
         _imageInfo,
          height: 100.0,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset (
          'lib/assets/user.png',
          height: 100.0,
          fit: BoxFit.cover,
        );
      }
}
}




 var _imageInfo ;

 Future<void> _getImgFile(BuildContext context) async {
    final infos = await ImagePickerWeb.getImageAsBytes();
  _imageInfo =
        infos;
        print(_imageInfo);
         Navigator.of(context).pushNamedAndRemoveUntil("perfil", (Route<dynamic> route) => false);
  }

TextEditingController controllerNome = TextEditingController();
Future<void> exibirDialogo(BuildContext context, TextEditingController controller) async {
    

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Digite Alguma Coisa'),
          content: TextField(
            controller: controller,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                String textoDigitado = controllerNome.text;
                Navigator.of(context).pushNamedAndRemoveUntil('perfil', (route) => false);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


class endereco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 252,
      child: Text(
        'Endereço:\nRua- ${enderecoValores.rua}  \nNúmero - ${enderecoValores.numero}  \nBairro - ${enderecoValores.bairro}  \nComplemento- ${enderecoValores.complemento} ',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class editar extends StatelessWidget {
  editar(this.texto, this.rota);
  String texto, rota;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      child:
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                minimumSize: Size(160, 40)),
            onPressed: () {
              Navigator.pushNamed(context, rota);
            },
            child: Text(texto),
          ),
    );
  }
}

class editarNome extends StatelessWidget {
  editarNome(this.texto, this.rota);
  String texto, rota;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      child:
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                minimumSize: Size(160, 40)),
            onPressed: () {
              exibirDialogo(context,controllerNome);
            },
            child: Text(texto),
          ),
    );
  }
}

