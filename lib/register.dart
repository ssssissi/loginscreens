import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(52, 99, 141, 400),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.info), onPressed:() => debugPrint("You need to sign in!")),
          IconButton(icon: const Icon(Icons.settings), onPressed:() => RenderObject.debugActiveLayout)
        ],
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
                alignment: Alignment.topCenter,
              ),
              borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.elliptical(800, 700)),
            ),
          ),
        ),
      ),
            SingleChildScrollView(
              child: Container (
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
                                    height: 50,
                                  ),
                                   const Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          TextField(
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
                                hintText: "Name",
                                hintStyle: const TextStyle(color: Color(0xff153576)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
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
                                hintStyle: const TextStyle(color: Color(0xff153576)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.black),
                            obscureText: true,
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
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: const TextStyle(color: Color(0xff153576)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
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
                                hintText: "Telephone",
                                hintStyle: const TextStyle(color: Color(0xff153576)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Color(0xff051b47),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 33),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff051b47),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}