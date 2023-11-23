import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_eats/view/inicio.dart';
import 'package:dash_eats/view/produto.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';

TextEditingController txt = TextEditingController();

 var imageUrls= [
          'https://media.istockphoto.com/id/1318334963/pt/foto/typical-sweets-for-the-brazilian-june-party.jpg?s=612x612&w=0&k=20&c=WF9TFr1wf5GRWZyWmobsof31J-LFY_qxNpZLXsCxq-w=',
          'https://media.istockphoto.com/id/589415708/pt/foto/frutas-e-produtos-hort%C3%ADcolas-frescos.jpg?s=612x612&w=0&k=20&c=_F8MQoPVXWCH6IKI01lCLpMAQO0tEp7-vcPHMADhDbo=',
          'https://media.istockphoto.com/id/1263686908/pt/foto/mixed-salty-snack-flat-lay-table-scene-on-a-wood-background.jpg?s=612x612&w=0&k=20&c=yAqVVFttJkM9KK1KP6aSQYuns93wozUHkXdfPOM53KY=',
          'https://media.istockphoto.com/id/1146683159/pt/foto/mini-meat-pastels-on-wood-background.jpg?s=612x612&w=0&k=20&c=HOiIvlfI7P_Ewh06F7e7Qp4o7CxS-duVReFQbu65y3g=',
          'https://media.istockphoto.com/id/1166273614/pt/foto/mother-giving-healthy-lunch-for-school-in-the-morning.jpg?s=612x612&w=0&k=20&c=W3X1Vm5s5GNBuQi5M5AjDr8tNaAk6NfznVJ8Rre4wmo=',
          'https://media.istockphoto.com/id/994427814/pt/foto/traditional-brazilian-snacks-coxinha-and-quibe-on-wooden-background-top-view.jpg?s=612x612&w=0&k=20&c=nr05qoJAb6tH8BnRgGh7ZWbLoIB_Xy3OTZpLpMNoF_k=',
         'https://media.istockphoto.com/id/1318334963/pt/foto/typical-sweets-for-the-brazilian-june-party.jpg?s=612x612&w=0&k=20&c=WF9TFr1wf5GRWZyWmobsof31J-LFY_qxNpZLXsCxq-w=',
          'https://media.istockphoto.com/id/589415708/pt/foto/frutas-e-produtos-hort%C3%ADcolas-frescos.jpg?s=612x612&w=0&k=20&c=_F8MQoPVXWCH6IKI01lCLpMAQO0tEp7-vcPHMADhDbo=',
          'https://media.istockphoto.com/id/1263686908/pt/foto/mixed-salty-snack-flat-lay-table-scene-on-a-wood-background.jpg?s=612x612&w=0&k=20&c=yAqVVFttJkM9KK1KP6aSQYuns93wozUHkXdfPOM53KY=',
          'https://media.istockphoto.com/id/1146683159/pt/foto/mini-meat-pastels-on-wood-background.jpg?s=612x612&w=0&k=20&c=HOiIvlfI7P_Ewh06F7e7Qp4o7CxS-duVReFQbu65y3g=',
          'https://media.istockphoto.com/id/1166273614/pt/foto/mother-giving-healthy-lunch-for-school-in-the-morning.jpg?s=612x612&w=0&k=20&c=W3X1Vm5s5GNBuQi5M5AjDr8tNaAk6NfznVJ8Rre4wmo=',
          'https://media.istockphoto.com/id/994427814/pt/foto/traditional-brazilian-snacks-coxinha-and-quibe-on-wooden-background-top-view.jpg?s=612x612&w=0&k=20&c=nr05qoJAb6tH8BnRgGh7ZWbLoIB_Xy3OTZpLpMNoF_k=',
          'https://media.istockphoto.com/id/1318334963/pt/foto/typical-sweets-for-the-brazilian-june-party.jpg?s=612x612&w=0&k=20&c=WF9TFr1wf5GRWZyWmobsof31J-LFY_qxNpZLXsCxq-w=',
          'https://media.istockphoto.com/id/589415708/pt/foto/frutas-e-produtos-hort%C3%ADcolas-frescos.jpg?s=612x612&w=0&k=20&c=_F8MQoPVXWCH6IKI01lCLpMAQO0tEp7-vcPHMADhDbo=',
          'https://media.istockphoto.com/id/1263686908/pt/foto/mixed-salty-snack-flat-lay-table-scene-on-a-wood-background.jpg?s=612x612&w=0&k=20&c=yAqVVFttJkM9KK1KP6aSQYuns93wozUHkXdfPOM53KY=',
          'https://media.istockphoto.com/id/1146683159/pt/foto/mini-meat-pastels-on-wood-background.jpg?s=612x612&w=0&k=20&c=HOiIvlfI7P_Ewh06F7e7Qp4o7CxS-duVReFQbu65y3g=',
          'https://media.istockphoto.com/id/1166273614/pt/foto/mother-giving-healthy-lunch-for-school-in-the-morning.jpg?s=612x612&w=0&k=20&c=W3X1Vm5s5GNBuQi5M5AjDr8tNaAk6NfznVJ8Rre4wmo=',
          'https://media.istockphoto.com/id/994427814/pt/foto/traditional-brazilian-snacks-coxinha-and-quibe-on-wooden-background-top-view.jpg?s=612x612&w=0&k=20&c=nr05qoJAb6tH8BnRgGh7ZWbLoIB_Xy3OTZpLpMNoF_k=',
        ];

class pesquisaView extends StatelessWidget {
  final  query;

  const pesquisaView({super.key,  this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEatsComDrawer(context),
      endDrawer: AppDrawer(),
      body:StreamBuilder<Object>(
        stream: FirebaseFirestore.instance.collection('produto')
                        .where('nome', isGreaterThanOrEqualTo: query)
                        .where('nome', isLessThan: query+ 'z')
                        .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState ==ConnectionState.active){

           var img_length = snapshot.data!.docs.length;
           
            return ListView(children: [
           Padding(
              padding: EdgeInsets.only(left: 40, right: 40,top: 5, bottom: 10),
              child: PesquisaBarra(txt),
            ),
            MyImageListView( data: snapshot.requireData ),
          ]);
          }
          return Text("erro");
        }
      ),
      bottomNavigationBar: rodape(),
    );
  }
}


class MyImageListItem extends StatelessWidget {
  final String imageUrl;
  final String nome;
  final double preco;

  MyImageListItem({required this.imageUrl, required this.preco, required this.nome});

  @override
  Widget build(BuildContext context) {

    var valor =preco;
    var produto ='Produto: ${nome}';

    return InkWell(
      child: SizedBox(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      
      ClipRRect(
        borderRadius:BorderRadius.circular(100),
        child: Image.network(
        imageUrl,
        width: 130,
        height: 130,
        fit: BoxFit.cover, 

      ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 40),
        child: Column(
          children: [
            Text(
                    '${produto}',
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black)),
            Text(
                    'Valor: R\$${valor}' ,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
      )
        
      

      ]
      ,)

    ),    onTap: () {
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => produtoView(
                  valor: valor.toDouble(), nome: produto, imagem: imageUrl,
                )));
      });
  }
}

class MyImageListView extends StatelessWidget {

  final data ;

  MyImageListView( {required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      shrinkWrap: true,
        itemCount: data.size,
        itemBuilder: (context, index) {
          
          return MyImageListItem(imageUrl: data.docs[index].data()["link_imagem"], preco: data.docs[index].data()["preço"], nome: data.docs[index].data()["nome"]);
        },
      );
  }
}

class PesquisaBarra extends StatelessWidget {
  PesquisaBarra(this.textoControle);

  TextEditingController textoControle = TextEditingController();
  @override
  Widget build(BuildContext build) {
    return Opacity(
      opacity: 0.4,
      child: TextField(
        controller: textoControle,
        onSubmitted: (textoControle){
             Navigator.push(
              build,
              MaterialPageRoute(
                builder: (context) => pesquisaView(
                  query: textoControle,
                )));
        },
        decoration: InputDecoration(
          hintText: "Pesquise por lanches,pizzas,bebid...",
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
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Colors.black,
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}