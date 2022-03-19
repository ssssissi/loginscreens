import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen2.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<HomeScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHome2()));
  }
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xff051b47),
        child: Center(
          child: SizedBox(
            width: 400,
            height: 300,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                    child: Image.asset('assets/images/logo.png.png', height: 200, width: 200),
                    elevation: 20,
                  ),
                ]

            ),
          ),
        ),
      ),
    );
  }
}
