import 'package:dash_eats/controller/login_controller.dart';
import 'package:dash_eats/view/pesquisa.dart';
import 'package:dash_eats/view/produto.dart';
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
      body: FutureBuilder<String>(
        future: loginController().usuarioLogado(),
        builder: (context, snapshot) {
          if(snapshot.connectionState== ConnectionState.done){
          return ListView(children: [
            Column(children: [
              titulo("Categorias"),
              carroselCategorias(),
            ]),
            Padding(
              padding: const EdgeInsets.all(40),
              child: PesquisaBarra(txt),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: titulo("Recomendados"),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: carroselRecomendados(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 40),
              child: titulo("Estabelecimentos"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: carroselEstabelecimentos(),
              ),
            ),
          ] );};
           return Text('Não foi possivel encontrar dados');
        }
      ),
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
    backgroundColor: const Color.fromARGB(255, 207, 10, 10),
    iconTheme: const IconThemeData(color: Colors.black),
    actions: [
      Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 40,
          ),
          padding: const EdgeInsets.only(right: 20),
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
        onSubmitted: (textoControle) {
          Navigator.push(
              build,
              MaterialPageRoute(
                builder: (context) => pesquisaView(
                  query: textoControle,
                )));
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Pesquise por lanches,pizzas,bebid...",
          filled: true,
          fillColor: const Color(0xFFD9D9D9),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          prefixIcon: const Icon(Icons.search),
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

int cindex = 1;

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
              Navigator.of(context).pushNamedAndRemoveUntil(
                  'perfil', (Route<dynamic> route) => false);

              break;
            case 1:
              Navigator.of(context).pushNamedAndRemoveUntil(
                  'inicio', (Route<dynamic> route) => false);
              break;

            case 2:
              Navigator.of(context).pushNamedAndRemoveUntil(
                  'carrinho', (Route<dynamic> route) => false);
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Container(
              child: const Icon(
            Icons.person,
            size: 60,
          )),
          label: "Perfil",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 60),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, size: 60),
          label: "Carrinho",
        )
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 0,
      backgroundColor: const Color.fromARGB(255, 207, 10, 10),
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
      padding: const EdgeInsets.only(bottom: 9),
      child: Text(
        tituloMsg,
        style: const TextStyle(
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
              decoration: const BoxDecoration(
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
            leading: const Icon(Icons.home),
            title: const Text('Página Inicial'),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  'inicio', (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushNamed(context, 'perfil');
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  'sobre', (Route<dynamic> route) => false);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 380.0),
            child: ListTile(
              leading: const Icon(Icons.door_back_door_outlined),
              title: const Text('Sair'),
              onTap: () {
                loginController().logout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    'login', (Route<dynamic> route) => false);
              },
            ),
          )
        ],
      ),
    );
  }
}

void produto(BuildContext context,String img){
    Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => produtoView(
                  valor: 10, nome: "Produto Inicio", imagem:img ,
                )));
}

class carroselEstabelecimentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        GestureDetector(
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Fp-pWvxqaDOvtv6QCNI8SYrTy99MfarfcQ&usqp=CAU",
                scale: 100),
          ),
          onTap: () => Navigator.pushNamed(context,"empresa"),
        ),
        GestureDetector(
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                "data:image/png;base64,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",
                scale: 100),
  
          ),
                    onTap: () => Navigator.pushNamed(context,"empresa"),

        ),
        GestureDetector(
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Fp-pWvxqaDOvtv6QCNI8SYrTy99MfarfcQ&usqp=CAU",
                scale: 100),
          ),
                    onTap: () => Navigator.pushNamed(context,"empresa"),

        ),
        GestureDetector(
          child: CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Fp-pWvxqaDOvtv6QCNI8SYrTy99MfarfcQ&usqp=CAU",
                scale: 100),
          ),
                    onTap: () => Navigator.pushNamed(context,"empresa"),

        ),
      ],
      options: CarouselOptions(
        viewportFraction: 1,
        enableInfiniteScroll: true,
      ),
    );
  }
}

class carroselRecomendados extends StatelessWidget {
  var img= ["https://media.istockphoto.com/id/1146683159/pt/foto/mini-meat-pastels-on-wood-background.jpg?s=2048x2048&w=is&k=20&c=389zfNglDaMto6z6ssPg8w_7TvhA6dpexBGg5iQypvA=",
  "https://media.istockphoto.com/id/823381982/pt/foto/mortadella-sandwich.jpg?s=2048x2048&w=is&k=20&c=PD2AIzCwMTcMmNpLldwKLJwEo_rMmy_zgqD3MUxDsC4=",
  "https://media.istockphoto.com/id/1140646840/pt/foto/mother-giving-healthy-vegan-dessert-snacks-to-toddler-child-concept-of-healthy-sweets-for.jpg?s=2048x2048&w=is&k=20&c=7FQZlST_jGzGBK3nsIbbFOBK_8JZ-tXuu_aaov4F19E=",
  "https://media.istockphoto.com/id/1309352410/pt/foto/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=2048x2048&w=is&k=20&c=vOX__q55jfX2CvNxeVtm5x3K57uh49im62WtJDz7eBA="

  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        GestureDetector(
          child: Container(
              child: Image.network(
                  img[0],
                  alignment: Alignment.topCenter,
                )),
                onTap: () => produto(context,img[0]),
        ),
        GestureDetector(
          child: Container(
              child: Image.network(
            img[1],
            alignment: Alignment.topCenter,
          )),
          onTap: () => produto(context,img[1]),
        ),
        GestureDetector(
          child: Container(
              child: Image.network(
            img[2],
            alignment: Alignment.topCenter,
          )),
          onTap: () => produto(context,img[2]),
        ),
        GestureDetector(
          child: Container(
              child: Image.network(
           img[3],
            alignment: Alignment.topCenter,
          )),
          onTap: () => produto(context,img[3]),
        )
      ],
      options: CarouselOptions(
          viewportFraction: 1, enableInfiniteScroll: true, aspectRatio: 16 / 9),
    );
  }
}

class carroselCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
            child: const Text(
          'Sanduíches',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        )),
        Container(
            child: const Text(
          'Salgadinhos',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        )),
        Container(
          child: const Text(
            'Doces e Sobremesas',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        Container(
            child: const Text(
          'Pizzas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ))
      ],
      options: CarouselOptions(viewportFraction: 0.5, height: 30),
    );
  }
}
