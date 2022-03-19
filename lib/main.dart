import 'package:flutter/material.dart';
import 'package:untitled/forgot_password.dart';
import 'package:untitled/login.dart';
import 'package:untitled/register.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/verification.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:untitled/home_screen2.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:untitled/ID.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomeScreen(
    ),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'splash': (context) => const HomeScreen(),
      'forgot_password': (context) => const ForgotPass(),
      'verification': (context) => const Verification(),
      'home_screen2': (context) => const MyHome2(),
    },
  ));
  Magic.instance = Magic("pk_live_7F087B0E974982FB");
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Stack(
        children: [
          const Verification(),
          Magic.instance.relayer
        ],
      ),
    );
  }
}



