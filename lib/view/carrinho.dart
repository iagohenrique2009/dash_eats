import 'dart:js_util';

import 'package:dash_eats/view/cadastro.dart';
import 'package:dash_eats/view/inicio.dart';
import 'package:dash_eats/view/perfil.dart';
import 'package:flutter/material.dart';


class carrinhoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEatsComDrawer(context),
      endDrawer: AppDrawer(),
       body: ShoppingCartScreen(),
      bottomNavigationBar: rodape()
    );
  }
}

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

void adicionarProduto(String nome, double valor, int qtd,){
  CartItem novoItem = CartItem(nome, valor, qtd);
      cartItems.add(novoItem);

}

 List<CartItem> cartItems = [];


class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(
            color: Colors.black, 
            width: 2.0,
          ) ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(cartItem: cartItems[index]);
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Total: R\$: ${calculateTotal() + 3} \n Taxa de entrega: R\$:3.00',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if(enderecoValores.bairro==""||enderecoValores.numero=="" ||enderecoValores.rua=="" ){
                      mostrarAlertDialog(context, "Não foi possivel completar seu pedido, Complete os dados de endereço:\nBairro\nNumero\nrua'", "Nao foi possivel realizar pedido");
                  }
                  else if(calculateTotal()==0){
                    mostrarAlertDialog(context, "Não foi possivel completar seu pedido, Primeiro adicione itens ao carrinho'", "Nao foi possivel realizar pedido");
                  }
                  else{
                  mostrarAlertDialog(context, "Seu pedido foi realizado:\nValor Total:R\$'${calculateTotal()}\n Tempo de Espera:15min'", "Sucesso");
                  }
                },
                style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(50.0), 
              ),
              minimumSize: Size(20, 50)),
              child: Text(
            'Realizar Pedido',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
                ),
                
              ]),
        ),
        );
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

class CartItem {
  String name;
  double price;
  int quantity;

  CartItem(this.name, this.price, this.quantity);
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        title: Text(cartItem.name),
        subtitle: Text('R\$:${cartItem.price} x ${cartItem.quantity}'),
      ),
    );
  }
}
