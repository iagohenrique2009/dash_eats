import 'package:dash_eats/view/pesquisa.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'package:carousel_slider/carousel_slider.dart';

TextEditingController txt = TextEditingController();

class inicioView extends StatelessWidget {
  const inicioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEatsComDrawer(context),
      endDrawer: AppDrawer(),
      body: ListView(children: [
        Column(children: [
          titulo("Categorias"),
          carroselCategorias(),
        ]),
        Padding(
          padding: EdgeInsets.all(40),
          child: PesquisaBarra(txt),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: titulo("Recomendados"),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: carroselRecomendados(),
        ),
      ]),
      bottomNavigationBar: rodape(),
    );
  }
}

AppBar AppBarDashEatsComDrawer(BuildContext context) {
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
    actions: [
      Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: Icon(Icons.menu, size: 40,),
          padding: EdgeInsets.only(right: 20),
        );
      }),
    ],
  );
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
            Navigator.pushNamed(build, 'pesquisa');
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Pesquise por lanches,pizzas,bebid...",
          filled: true,
          fillColor: Color(0xFFD9D9D9),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.black, // Cor da borda quando o campo está em foco
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

class rodape extends StatefulWidget {

  @override
  rodapeState createState() => rodapeState();
}




int cindex =0;
class rodapeState extends State<rodape> {
  

  @override

  Widget build(BuildContext context) {
    int i;
    
    print(cindex);
    return BottomNavigationBar(
      
      currentIndex: cindex,
      onTap: (index) {
          // Update the selprint(cindex),ected index
          setState(() {
            cindex = index;
            switch (cindex) {
            case 0:
             Navigator.of(context)
    .pushNamedAndRemoveUntil('pesquisa', (Route<dynamic> route) => false);
              
              break;
            case 1:
                           Navigator.of(context)
    .pushNamedAndRemoveUntil('inicio', (Route<dynamic> route) => false);
              break;
            // Add more cases as needed
          }
          });
        },

        
        // ignore: avoid_print
      items: [
        BottomNavigationBarItem(
          icon: Container( 
            child: Icon(Icons.person, size: 60,  )),
          label: "Perfil",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 60),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, size: 60),
          label: "Carrinho",
        )
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 0,
      backgroundColor: Color.fromARGB(255, 207, 10, 10),
      selectedItemColor: Colors.black,
    );
    
  }
}

class titulo extends StatelessWidget {
  String tituloMsg;
  titulo(this.tituloMsg);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 9),
      child: Text(
        tituloMsg,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 10, 10),
              ),
              child: Text('DashEats',
                  style: GoogleFonts.getFont(
                    'Inter',
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ))),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Página Inicial'),
            onTap: () {
              // Implemente a navegação para a página inicial aqui
               Navigator.of(context)
    .pushNamedAndRemoveUntil('inicio', (Route<dynamic> route) => false);
              
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {
              // Implemente a navegação para as configurações aqui
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Sobre'),
            onTap: () {
              // Implemente a navegação para as configurações aqui
                             Navigator.of(context)
    .pushNamedAndRemoveUntil('sobre', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}

class carroselRecomendados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
            child: Container(
                child: Image.network(
          "https://media.istockphoto.com/id/1146683159/pt/foto/mini-meat-pastels-on-wood-background.jpg?s=2048x2048&w=is&k=20&c=389zfNglDaMto6z6ssPg8w_7TvhA6dpexBGg5iQypvA=",

          alignment: Alignment.topCenter,
        ))),
        Container(
            child: Container(
                child: Image.network(
          "https://media.istockphoto.com/id/823381982/pt/foto/mortadella-sandwich.jpg?s=2048x2048&w=is&k=20&c=PD2AIzCwMTcMmNpLldwKLJwEo_rMmy_zgqD3MUxDsC4=",

          alignment: Alignment.topCenter,
        ))),
        Container(
            child: Container(
                child: Image.network(
          "https://media.istockphoto.com/id/1140646840/pt/foto/mother-giving-healthy-vegan-dessert-snacks-to-toddler-child-concept-of-healthy-sweets-for.jpg?s=2048x2048&w=is&k=20&c=7FQZlST_jGzGBK3nsIbbFOBK_8JZ-tXuu_aaov4F19E=",

          alignment: Alignment.topCenter,
        ))),
        Container(
            child: Image.network(
          "https://media.istockphoto.com/id/1309352410/pt/foto/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=2048x2048&w=is&k=20&c=vOX__q55jfX2CvNxeVtm5x3K57uh49im62WtJDz7eBA=",
        
          alignment: Alignment.topCenter,
        ))
      ],
      options: CarouselOptions(
        viewportFraction: 1,
        enableInfiniteScroll: true,
      ),
    );
  }
}

class carroselCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
            child: Text(
          'Categorias',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        )),
        Container(
            child: Text(
          'Categorias',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        )),
        Container(
          child: Text(
            'Categorias',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        Container(
            child: Text(
          'Categorias',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ))
      ],
      options: CarouselOptions(viewportFraction: 0.4, height: 30),
    );
  }
}
