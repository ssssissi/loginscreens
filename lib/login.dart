import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/verification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/utils.dart';
import 'package:untitled/verification.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String ? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(52, 99, 141, 400),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.info),
              onPressed: () => debugPrint("You need to sign in!")),
          IconButton(icon: const Icon(Icons.settings),
              onPressed: () => RenderObject.debugActiveLayout)
        ],
      ),
      body: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Material(
                      color: Colors.cyan.shade100,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 300),
                        child: const Material(color: Color.fromRGBO(
                            52, 99, 141, 300),
                          elevation: 0.5,
                          child: Align(
                            alignment: Alignment.center,
                          ),
                          borderRadius: BorderRadiusDirectional.vertical(
                              bottom: Radius.elliptical(800, 700)),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(

                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKey,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 35, right: 35, bottom: 50),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                      width: 200,
                                      height: 250,
                                      child: Column(
                                        children: <Widget>[
                                          Material(
                                            elevation: 10,
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(50.0)),
                                            child: Image.asset(
                                                'assets/images/logo.png.png',
                                                height: 95, width: 95),
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          const Text(
                                            'Ready to perform?',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 33,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.italic),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                TextFormField(
                                    controller: _emailController,
                                    style: const TextStyle(color: Colors.black),
    validator: (value) {
    if (value!.isEmpty) {
    return ("Please Enter Your Email");
    }
    // reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
    return ("Please Enter a valid email");
    }
    return null;
    },
    onSaved: (value) {
    _emailController.text = value!;
    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide: const BorderSide(
                                            color: Color(0xff051b47),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        hintText: "Email",
                                        hintStyle: const TextStyle(
                                            color: Color(0xff153576)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  TextFormField(
                                    controller: _passController,
                                    obscureText: true,
                                    validator: (value) {
    RegExp regex = RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
    return ("Password is required for login");
    }
    if (!regex.hasMatch(value)) {
    return ("Enter Valid Password(Min. 6 Character)");
    }
    },
    onSaved: (value) {
    _passController.text = value!;
    },
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide: const BorderSide(
                                            color: Color(0xff051b47),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        hintText: "Password",
                                        hintStyle: const TextStyle(
                                            color: Color(0xff153576)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      const Text(
                                        'Sign in',
                                        style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: const Color(
                                            0xff051b47),
                                        child: IconButton(
                                            color: Colors.white,
                                            onPressed: () async {
    signIn(_emailController.text, _passController.text);
    },
                                            icon: const Icon(
                                              Icons.arrow_forward,
                                            )),
                            ),
                              ],
                                      ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, 'forgot_password');
                                          },
                                          child: const Text(
                                            'Forgot Password',
                                            style: TextStyle(
                                              decoration: TextDecoration
                                                  .underline,
                                              color: Color(0xff051b47),
                                              fontSize: 22,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

void signIn(String email, String password) async {
  if (_formKey.currentState!.validate()) {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Verification())),
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      showSnackBar(context, errorMessage!);
    }
  }
}
}