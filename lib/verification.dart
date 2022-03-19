import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';
class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);
  @override
  _Verify createState() => _Verify();
}

class _Verify extends State<Verification>{
  final TextEditingController phoneController = TextEditingController();
  login(BuildContext context) async {
    Magic magic= Magic.instance;
    final token =
    await magic.auth.loginWithSMS(phoneNumber: phoneController.text);
    print(token);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                                          'Verify Your Identity',
                                          style: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
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
                                      hintText: "Phone Number",
                                      hintStyle: const TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    login(context);
                                  },
                                  style: ElevatedButton.styleFrom(primary: const Color(0xff051b47),
                                      fixedSize: const Size(130, 50),
                                      textStyle: const TextStyle(fontSize: 16),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                  ),
                                  child: const Text('Send code'),

                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
        Magic.instance.relayer
      ],
    );
  }

}