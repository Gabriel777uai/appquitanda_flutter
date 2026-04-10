import 'package:appquitanda_flutter/src/config/custom_colors.dart';
import 'package:appquitanda_flutter/src/pages/comom_widgets/custom_text_field.dart';
import 'package:appquitanda_flutter/src/config/app_data.dart' as app_data;
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Perfil do usuario"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16,32,16,16),
        children: [
          //email
          CustomTextField(
            readOnly: true,
            value: app_data.user.email,
            iconData: Icons.email,
            label: "Email",
          ),
          // nome
          CustomTextField(
            readOnly: true,
            value: app_data.user.name,
            iconData: Icons.person,
            label: "Nome",
          ),
          //cll
          CustomTextField(
            readOnly: true,
            value: app_data.user.phone,
            iconData: Icons.phone,
            label: "Celular",
          ),

          //cpf
          CustomTextField(
            readOnly: true,
            value: app_data.user.cpf,
            iconData: Icons.copy,
            label: "CPF",
            isSecret: true,
          ),
          //botao atualizar
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: CustomColors.customSwatchColor,
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {

              },
              child: const Text("Atualizar senha")
            ),
          )
        ],
      ),
    );
  }


}