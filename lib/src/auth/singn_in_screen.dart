import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'components/custom_text_field.dart';

class SingnInScreen extends StatelessWidget {
  const SingnInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 202, 87),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
              //Logo app
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 40,
                    ),
                    children: [
                      TextSpan(
                        text: "Green",
                        style: TextStyle(
                          color:  Colors.white,
                          fontWeight: FontWeight.bold
                        ),  
                      ),
                      TextSpan(
                        text: "grocer",
                        style: TextStyle(
                          color:  Color.fromARGB(255, 177, 49, 39),
                        ),  
                      )
                    ]
                  )
                ),

                //Categorias
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText(
                          "Frutas, verduras e legumes",
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withAlpha(200),
                          ),
                        ),
                        FadeAnimatedText(
                          "Carnes, peixes e ovos",
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withAlpha(200),
                          ),
                        ),
                        FadeAnimatedText(
                          "Bebidas, laticínios e congelados",
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withAlpha(200),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //input de email
                const CustomTextField(iconData: Icons.email, label: "Email"),
                //input de senha
                const CustomTextField(
                  iconData: Icons.lock,
                  label: "Senha",
                  isSecret: true,
                ),
                //Formulario de login
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text("Entrar", style: TextStyle(fontSize: 18)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Esqueci minha senha?",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withAlpha(90),
                        thickness: 2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("ou"),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withAlpha(90),
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green,
                      side: const BorderSide(width: 2, color: Colors.green),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
