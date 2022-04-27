import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPass createState() => _ForgotPass();
}

class _ForgotPass extends State<ForgotPass>{
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack (
    children: [
      Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(52, 99, 141, 400),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.info), onPressed:() => debugPrint("You need to sign in!")),
          IconButton(icon: const Icon(Icons.settings), onPressed:() => RenderObject.debugActiveLayout),
        ],
        title: const Center(
            child: Text("PerfoRm",textAlign: TextAlign.center)
        ),
      ),
      body: Container (
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children:<Widget> [
            Align(
              child: Material(
                color: Colors.cyan.shade100,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 300),
                  child: const Material(color: Color.fromRGBO(52, 99, 141, 300),
                    elevation: 0.5,
                    child: Align(
                      alignment: Alignment.center,
                    ),
                    borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.elliptical(800, 700)),

                  ),
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                Container (
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 35, right: 35,bottom: 50),
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
                                        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                                        child: Image.asset('assets/images/logo.png.png', height: 95, width: 95),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      const Text(
                                        'Resset Your Password',
                                        style: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: emailController,
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
                                  emailController.text = value!;
                                },
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0xff051b47),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    hintText: "Email",
                                    hintStyle: const TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff051b47),
                                child: IconButton(
                                    color: Colors.white,
                                    icon: const Icon(
                                      Icons.vpn_key,
                                    ),
                                    onPressed: () {
                                      FirebaseAuth.instance.sendPasswordResetEmail(
                                        email: emailController.text)
                                    .then((value) => Navigator.of(context).pop());
                                    }
                                      ),
                                ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    ],
    );
  }
}

