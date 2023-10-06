import 'package:flutter/material.dart';

class cadastroView extends StatelessWidget {
    const cadastroView({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 360,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05000000074505806),
                  ),
                ),
              ),
              Positioned(
                left: 28,
                top: 28,
                child: Text(
                  'DashEats',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 695,
                child: Container(
                  width: 360,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05000000074505806),
                  ),
                ),
              ),
              Positioned(
                left: 63,
                top: 449,
                child: Container(
                  width: 239,
                  height: 40,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 239,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 200,
                        top: 5,
                        child: Container(
                          width: 29,
                          height: 29,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 13,
                        child: Text(
                          'Cadastre-se com o google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 63,
                top: 512,
                child: Container(
                  width: 239,
                  height: 40,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 239,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 200,
                        top: 5,
                        child: Container(
                          width: 29,
                          height: 29,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 14,
                        child: Text(
                          'Cadastre-se com o Facebook',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 71,
                top: 397,
                child: Container(
                  width: 219,
                  height: 28,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 58,
                        top: 7,
                        child: Text(
                          'Finalizar Cadastro',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 193,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 24,
                    left: 24,
                    right: 22,
                    bottom: 3,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 220,
                        height: 29,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 220,
                                height: 29,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9,
                              top: 7,
                              child: SizedBox(
                                width: 197,
                                child: Opacity(
                                  opacity: 0.40,
                                  child: Text(
                                    'Email ou telefone',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: 220,
                        height: 29,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 220,
                                height: 29,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9,
                              top: 7,
                              child: SizedBox(
                                width: 200,
                                height: 15,
                                child: Opacity(
                                  opacity: 0.40,
                                  child: Text(
                                    'CPF : 000.000.000-00 ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: 220,
                        height: 29,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 220,
                                height: 29,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9,
                              top: 7,
                              child: SizedBox(
                                width: 197,
                                child: Opacity(
                                  opacity: 0.40,
                                  child: Text(
                                    'Nome de usuário',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.9599999785423279),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: 220,
                        height: 29,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 220,
                                height: 29,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 8,
                              top: 7,
                              child: Text(
                                'Senha',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.4000000059604645),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}