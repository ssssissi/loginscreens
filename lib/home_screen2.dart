import 'package:flutter/material.dart';
import 'package:untitled/login.dart';
import 'package:untitled/register.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:untitled/ID.dart';

import 'ID.dart';
import 'login.dart';

class MyHome2 extends StatefulWidget {
  const MyHome2({Key? key}) : super(key: key);

  @override
  _MyHome2 createState() => _MyHome2();
}

class _MyHome2 extends State<MyHome2> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromRGBO(52, 99, 141, 100),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(icon: const Icon(Icons.info), onPressed:() => debugPrint("You need to sign in!")),
              IconButton(icon: const Icon(Icons.settings), onPressed:() => RenderObject.debugActiveLayout),
            ],
            title: const Center(

            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(52, 99, 141, 200),
            child: Center(
              child: SizedBox(
                width: 400,
                height: 480,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                      borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                      child: Image.asset('assets/images/logo.png.png', height: 200, width: 200),
                      elevation: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        ElevatedButton(
                          onPressed: () async {
                            final isAuthenticated = await MyAuth.authenticate();
                            if (isAuthenticated) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const MyLogin()),
                              );
                            }
                            else {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => const MyLogin())
                              );
                            }

                          },
                          style: ElevatedButton.styleFrom(primary: const Color.fromRGBO(52, 99, 141, 200),
                              fixedSize: const Size(120, 60),
                              side: BorderSide(width: 1.5, color: Colors.white),
                              textStyle: const TextStyle(fontSize: 18),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), shadowColor: Colors.white),

                          child: const Text('Sign In', style: TextStyle(color: Colors.white)),

                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          style: ElevatedButton.styleFrom(primary: const Color.fromRGBO(52, 99, 141, 200),
                              fixedSize: const Size(120, 60),
                              side: BorderSide(width: 1.5, color: Colors.white),
                              textStyle: const TextStyle(fontSize: 18),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), shadowColor: Colors.white
                          ),
                          child: const Text('Sign Up'),

                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
