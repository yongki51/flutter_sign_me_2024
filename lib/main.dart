import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sign_me/pages/auth/welcome_page.dart';
import 'package:flutter_sign_me/themes/colors.dart';
import 'package:flutter_sign_me/themes/images_path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Me',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: smcWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: smcWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: smcWhite),
          ),
          prefixIconColor: smcGreen,
          hintStyle: TextStyle(color: smcGrey99),
          suffixIconColor: smcPurple,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: smcGreen),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(logoImg),
        duration: 1500,
        splashIconSize: 125,
        nextScreen: const WelcomePage(),
      ),
    );
  }
}
