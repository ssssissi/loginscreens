import 'package:flutter/material.dart';
import 'package:untitled/Mont.dart';
import 'package:untitled/Stager.dart';
import 'package:untitled/Surbeck.dart';
import 'package:untitled/forgot_password.dart';
import 'package:untitled/login.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/profile_page.dart';
import 'package:untitled/verification.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:untitled/home_screen2.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomeScreen(
    ),
    routes: {
      'login': (context) => const MyLogin(),
      'splash': (context) => const HomeScreen(),
      'forgot_password': (context) => const ForgotPass(),
      'verification': (context) => const Verification(),
      'home_screen2': (context) => const MyHome2(),
      'profile_page': (context) => const MyProfile(),
      'mont': (context) => const Mont(),
      'stager': (context) => const Stager(),
      'surbeck': (context) => const Surbeck()
    },
  ));
  Magic.instance = Magic("pk_live_7F087B0E974982FB");
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}




