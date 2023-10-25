import 'package:dash_eats/view/cadastro.dart';
import 'package:dash_eats/view/carrinho.dart';
import 'package:dash_eats/view/inicio.dart';
import 'package:dash_eats/view/perfil.dart';
import 'package:flutter/material.dart';

 


class produtoView extends StatelessWidget {
  final String? nome;
  final double valor;
  const produtoView({super.key, this.nome, required this.valor});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEatsComDrawer(context),
      endDrawer: AppDrawer(),
      body: ProductCard(nome!,valor!),
      bottomNavigationBar: rodape(),
    );
  }
}

class ProductCard extends StatelessWidget {
  TextEditingController qtd = TextEditingController();

    ProductCard(this.nome,this.valor);

    String nome='Produto';
    double valor=10;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Image.network(
          "https://media.istockphoto.com/id/1146683159/pt/foto/mini-meat-pastels-on-wood-background.jpg?s=2048x2048&w=is&k=20&c=389zfNglDaMto6z6ssPg8w_7TvhA6dpexBGg5iQypvA=",
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
                
                  Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://media.istockphoto.com/id/1146683159/pt/foto/mini-meat-pastels-on-wood-background.jpg?s=2048x2048&w=is&k=20&c=389zfNglDaMto6z6ssPg8w_7TvhA6dpexBGg5iQypvA=',
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
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
            ),
            TextButton(
              onPressed: () {
                try{
                String textoDigitado = controllerNome.text;
                _handleSubmit( controllerNome);
                adicionarProduto(nome,valor, int.parse(controller.text.toString()) );
                Navigator.pushNamed(context, 'carrinho');
                mostrarAlertDialog(context, "Produto Adicionado com sucesso", "Sucesso");
                }
                on Exception catch (e){
                  print('erro: ${e.toString()}');
                    mostrarAlertDialog(context, "Quantidade incorreta", "Erro de validação");
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  
  void _handleSubmit(TextEditingController controller) {
    

}