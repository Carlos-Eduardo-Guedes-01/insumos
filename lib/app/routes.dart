import '../views/primary_page.dart';
import '../views/sobre.dart';
import 'package:flutter/material.dart';

import '../screen/detalhes.dart';
import '../views/buscas.dart';
import '../views/views_home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caderno Insumos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnimatedSplashScreen(
        duration: 4,
        splash: Image.asset(
          'assets/img/splash_ICON.png',
        ),
        nextScreen: PrimaryPage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color.fromRGBO(255, 217, 195, 1),
        pageTransitionType: PageTransitionType.fade,
      ),
      routes: {
        PrimaryPage.routeName: (context) => PrimaryPage(),
        ScreenHomePage.routeName: (context) => ScreenHomePage(),
        SeachPage.routeName: (context) => SeachPage(),
        DetalheProduto.routeName: (context) => DetalheProduto(),
        SobrePage.routeName: (context) => SobrePage(),
      },
    );
  }
}
