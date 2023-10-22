import 'package:flutter/material.dart';
import 'login.dart';
import 'package:carousel_slider/carousel_slider.dart';

class inicioView extends StatelessWidget {
  const inicioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDashEats(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: MyCarouselScreen(),
      ),
    );
  }
}

class MyCarouselScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              )),
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              )),
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              )),
        ),
        Container(
          child:Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              )),
        )
      ],
      options: CarouselOptions(
        viewportFraction: 0.4,
      ),
    );
  }
}
