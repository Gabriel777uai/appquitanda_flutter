import 'package:Greengrocer/src/config/custom_colors.dart';
import 'package:Greengrocer/src/pages/auth/singn_in_screen.dart';
import 'package:Greengrocer/src/pages/comom_widgets/app_name_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
        return SingnInScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              
              CustomColors.customSwatchColor.shade700,
              CustomColors.customSwatchColor.shade900,
          ])
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppNameWidget(
              greenTitleColor: Colors.white,
              textSize: 40,
            ),
            SizedBox(height: 15),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}