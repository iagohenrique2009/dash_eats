import 'package:dash_eats/view/cadastro.dart';
import 'package:dash_eats/view/carrinho.dart';
import 'package:dash_eats/view/inicio.dart';
import 'package:dash_eats/view/perfil.dart';
import 'package:flutter/material.dart';

 


class produtoView extends StatelessWidget {
  final String? nome;
  final double valor;
  final String imagem;
  const produtoView({super.key, this.nome, required this.valor, required this.imagem});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEatsComDrawer(context),
      endDrawer: AppDrawer(),
      body: ProductCard(nome!,valor!,imagem),
      bottomNavigationBar: rodape(),
    );
  }
}

class ProductCard extends StatelessWidget {
  TextEditingController qtd = TextEditingController();

    ProductCard(this.nome,this.valor, this.img);

    String nome='Produto';
    double valor=10;
    String img;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Image.network(
          img,
          alignment: Alignment.topCenter,
        ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome as String,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  valor.toStringAsFixed(2),
                  style: TextStyle(fontSize: 16.0, color: Colors.green),
                ),
                SizedBox(height: 30.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  'Informaçoes sobre o Estabelecimento: ',
                  style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                    Padding(padding: EdgeInsets.only(top: 30),
                    child: Estabelecimento()
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 42),
            child: ElevatedButton(
              onPressed: () {
                exibirQuantidade(context,qtd,nome,valor);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(20, 60)
              ),
              child: Text(
                  'Adicionar ao Carrinho',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
                ),
            ),
          ),
        ],
      ),
    );
  }}

  class Estabelecimento extends StatelessWidget{

    Widget build(BuildContext context){
    return  Row(
              children: [
                
                  InkWell(
                    onTap:  () => Navigator.pushNamed(context, 'empresa'),
                    child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'data:image/png;base64,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',
                        ),
                      ),
                    ),
                                  ),
                  ),

            SizedBox(width: 50.0), 
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
          'Estabelecimento:\nNome',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
                      Text(
          'Distacia ate endereço:\n2km',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
                      Text(
          'Estimativa de Entrega:\n15min',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
                    ],
                  ),
                ),
                

              ],
            );

  }
  }

  Future<void> exibirQuantidade(BuildContext context, TextEditingController controller,String nome, double valor) async {
    

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Digite a quantidade'),
          content: TextFormField(
            controller: controller,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                try{
                String textoDigitado = controllerNome.text;
                _handleSubmit( controllerNome);
                adicionarProduto(nome,valor, int.parse(controller.text.toString()) );
                Navigator.of(context).pushNamedAndRemoveUntil('carrinho', (route) => false);
                mostrarAlertDialog(context, "Produto Adicionado com sucesso", "Sucesso");
                Navigator.of(context).pop();
                }
                on Exception catch (e){
                  print('erro: ${e.toString()}');
                    mostrarAlertDialog(context, "Quantidade incorreta", "Erro de validação");
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
  
  void _handleSubmit(TextEditingController controller) {
    

}