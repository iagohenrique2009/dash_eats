// ignore_for_file: camel_case_types, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_eats/controller/perfil_controller.dart';
import 'package:dash_eats/view/cadastro.dart';
import 'package:dash_eats/view/perfil.dart';
import 'package:flutter/material.dart';
import 'login.dart';

TextEditingController ruaController = TextEditingController();
TextEditingController nController = TextEditingController();
TextEditingController baiController = TextEditingController();
TextEditingController conController = TextEditingController();

class editEndView extends StatelessWidget {
  const editEndView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEats(),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: InputField("Rua", ruaController),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("Número", nController),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("Bairro", baiController),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputField("Complemento", conController),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: 
                          BorderRadius.circular(50.0)
                      ),

                      minimumSize: Size(160, 50)
                      ),

                      onPressed: () {
                        

                        
                        perfil_controller().atualizarEndereco(context, ruaController.text, nController.text, baiController.text, conController.text);
                        Navigator.pushNamed(context, 'perfil');
                        
                      },

                      child: const Text('Salvar Endereço'),      
                     ),
                  
            ),
            
          ],
          
        ),
      ),
      
    );
  }
}


class endereco {
  final String bairro;
  final String rua;
  final String numero;
  final String complemento;

  endereco(this.bairro, this.rua, this.numero, this.complemento);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'bairro': bairro,
      'rua': rua,
      'numero': numero,
      'complemento': complemento
      
    };
  }

  factory endereco.fromJson(Map<String, dynamic> json) {
    return endereco(
      json['bairro'],
      json['rua'],
      json['numero'],
      json['complemento'],
    );
  }
}

void endAdicionar (context, endereco t){
  FirebaseFirestore.instance
            .collection('enderecos') 
            .add(t.toJson())
            .then(
              (value) => mostrarAlertDialog(context,  'Endereço modificado com sucesso', 'Sucesso'),
              )
            .catchError(
              (error) => mostrarAlertDialog(context, 'Erro ao adicionar endereço: ${error}', 'Erro'), 
              )
              .whenComplete(
                () => Navigator.pushNamed(context, 'perfil'));
}