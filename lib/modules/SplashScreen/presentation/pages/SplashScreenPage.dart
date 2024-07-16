import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:telphanews/modules/SettingScreen/presentation/settingScreen.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

   body:AnimatedSplashScreen(
            duration: 3000,
            splash: Icons.home,
            nextScreen: SettingsPage(toggleTheme: () {  },),
            splashTransition: SplashTransition.fadeTransition,
          //  pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.blue));
  }
}

    
  