import 'package:appquitanda_flutter/src/config/custom_colors.dart';
import 'package:appquitanda_flutter/src/pages/comom_widgets/custom_text_field.dart';
import 'package:appquitanda_flutter/src/config/app_data.dart' as app_data;
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
                updatePassword();
              },
              child: const Text("Atualizar senha")
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text("Atualização de senha",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                    const CustomTextField(
                      iconData: Icons.lock,
                      label: "Senha atual",
                      isSecret: true,
                    ),
                    const CustomTextField(
                      iconData: Icons.lock_outline,
                      label: "Nova senha",
                      isSecret: true,
                    ),
                    const CustomTextField(
                      iconData: Icons.lock_outline,
                      label: "Confirm nova senha",
                      isSecret: true,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Atualizar")
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close)
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}