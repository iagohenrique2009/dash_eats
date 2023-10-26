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

                        enderecoValores.bairro = baiController.text;
                        enderecoValores.rua = ruaController.text;
                        enderecoValores.numero = nController.text;
                        enderecoValores.complemento = conController.text;

                        
                        Navigator.pushNamed(context, 'perfil');
                        mostrarAlertDialog(context,"Endereço Atualizado com sucesso","Sucesso");
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

