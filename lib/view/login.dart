import 'package:flutter/material.dart';

class loginView extends StatelessWidget {
  const loginView({super.key});

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
                left: 70,
                top: 240,
                child: Container(
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
              ),
              Positioned(
                left: 70,
                top: 285,
                child: Container(
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
                              'Senha',
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
              ),
              OutlinedButton(
                child: Text(
                  'Ainda não é usuário?',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    height: 0,
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, "cadastro"),
              ),
              Positioned(
                left: 123,
                top: 597,
                child: Text(
                  'Cadastrar Empresa',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    height: 0,
                  ),
                ),
                
              ),
              Positioned(
                left: 61,
                top: 430,
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
                          'Continuar com o Google',
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
                left: 61,
                top: 493,
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
                        )
                      ),
                      Positioned(
                        left: 20,
                        top: 14,
                        child: Text(
                          'Continuar com o  Facebook',
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
                top: 326,
                child: Container(
                  width: 219,
                  height: 28,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 93,
                        top: 7,
                        child: Text(
                          'Login',
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
            ],
          ),
        ),
      ],
    );
  }
}