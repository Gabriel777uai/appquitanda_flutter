import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appquitanda_flutter/src/config/custom_colors.dart';
import 'package:appquitanda_flutter/src/pages/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:appquitanda_flutter/src/pages/auth/singn_up_screen.dart';
import '../comom_widgets/custom_text_field.dart';

class SingnInScreen extends StatelessWidget {
  const SingnInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                  //Logo app
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                            text: "Green",
                            style: TextStyle(
                              color:  Colors.white,
                              fontWeight: FontWeight.bold
                            ),  
                          ),
                          TextSpan(
                            text: "grocer",
                            style: TextStyle(
                              color:  CustomColors.customColors,
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
                          pause: Duration.zero,
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
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) {
                              return BaseScreen();
                            })
                          );
                        },
                        child: const Text("Entrar", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Esqueci minha senha?",
                          style: TextStyle(color: CustomColors.customColors, fontSize: 12),
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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) {
                              return SingnUpScreen();
                            })
                          );
                        },
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
        ),
      ),
    );
  }
}
