// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class rest {
  final String titulo;
  rest(this.titulo);

  static List<rest> gerarTarefas(int num) {
    List<rest> lista = [];
      lista.add(rest(
        'Text'));
    
    return lista;
  }
}




class editRestView extends StatefulWidget {
  const editRestView({super.key});

  @override
  State<editRestView> createState() => editRestViewState();
}

class editRestViewState extends State<editRestView> {
  
  // Lista Dinâmica 
  
  List<rest> lista = [];

  var txtTitulo = TextEditingController();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Restrições'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          
          itemCount: lista.length,
          
          itemBuilder: (context, position) {
            return Card(
              margin: EdgeInsets.only(bottom: 15),
              color: Colors.grey.shade300,
              child: ListTile(
                title: Text(
                  lista[position].titulo,
                  style: TextStyle(fontSize: 24),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                  ),
                  onPressed: () {
                    setState(() {
                      lista.removeAt(position);
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            txtTitulo.clear();
          });
          caixaDialogo(context);
        },
      ),
    );
  }

  caixaDialogo(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escreva sua Restrição'),
          content: SizedBox(
            height: 51,
            child: Column(
              children: [
                TextField(
                  controller: txtTitulo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                //Adicionar um novo Item na lista
                setState(() {
                  lista.add(
                    rest(txtTitulo.text,),
                  );
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Restrição adicionada com sucesso.'),
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}
