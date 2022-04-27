import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:untitled/SurbeckPort.dart';
import 'package:untitled/SurbeckTrading.dart';
import 'package:untitled/calendar.dart';
import 'package:untitled/profile_page.dart';
import 'package:untitled/settings.dart';
import 'package:untitled/stocks.dart';

class KYCSu extends StatefulWidget {
  const KYCSu({Key? key}) : super(key: key);

  @override
  _KYCSuState createState() => _KYCSuState();
}
class _KYCSuState extends State<KYCSu> {
  getMethod() async{
    String theUrl = "https://flutterperform.000webhostapp.com/KYCSurbeck.php";
    var res = await http.get(Uri.parse(theUrl), headers: {"Accept":"application/json"});
    var responseBody = json.decode(res.body);
    print(responseBody);
    return responseBody;
  }
  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false,

      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Client KYC'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text('On this page you can see all the information needed for a complete KYC check and what the client has provided.'),
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      bottomNavigationBar:
      BottomAppBar(
        color:const Color(0xff051b47),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  const Calender()));
            }, icon: const Icon(Icons.calendar_today,color: Colors.white,
                size:32)),
            const SizedBox(width: 80),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  const Stocks()));
            }, icon: const Icon(Icons.analytics, color: Colors.white, size: 32)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.account_circle,
          size: 50,
          color: Color(0xff051b47)),
          backgroundColor: Colors.white,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const MyProfile()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text("PerfoRM", textAlign: TextAlign.center),
        backgroundColor: const Color(0xff051b47),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.info),
              onPressed: _showcontent),
          IconButton(icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>  const Settings()));
              })
        ],
      ),
      body: Stack(
        children:[
          FutureBuilder(
            future: getMethod(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              List snap=snapshot.data;
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(snapshot.hasError){
                return const Center(
                  child: Text("Error"),
                );
              }
              return ListView.builder(
                itemCount:snap.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                dragStartBehavior: DragStartBehavior.down,
                itemBuilder: (context, index)
                {
                  return SizedBox(
                    height: 600,
                    child:Card(
                      color: const Color.fromRGBO(52, 99, 141, 800),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 10),
                            Text("KYC\n ${snap[index]['firstName']} ${snap[index]['surname']}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 25,
                                    letterSpacing:2,
                                    color: Colors.white
                                )
                            ),
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Client ID: ${snap[index]['clientID']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Address: ${snap[index]['address']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Date of birth: ${snap[index]['dateBirth']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Attached goverment document: ${snap[index]['govDocAttached']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Pep Check: ${snap[index]['pepCheck']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Mailing Address: ${snap[index]['mailAddress']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Transit Account No: ${snap[index]['transitAccountNo']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Transit Account Holder: ${snap[index]['transitAccountHolder']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Source of Wealth: ${snap[index]['sourceWealth']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Client Knowledge: ${snap[index]['clientKnow']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                                Text("Paper Mailing: ${snap[index]['paperMail']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        letterSpacing:1,
                                        color: Colors.white60
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Column(
              children: [
                const SizedBox(height: 10),
                Material(
                  elevation: 10,
                  borderRadius: const BorderRadius
                      .all(Radius.circular(100.0)),
                  child: Image.asset(
                      'assets/images/user.png',
                      height: 95, width: 95),
                ),
                const SizedBox(height: 500),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    ElevatedButton(
                        onPressed: (){Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SurbeckPort()));},
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff051b47),
                            fixedSize: const Size(120, 60),
                            side: const BorderSide(width: 1.5, color: Colors.white),
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            shadowColor: Colors.white),
                        child: const Text("Portfolios")),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SurbeckTrading()));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff051b47),
                            fixedSize: const Size(120, 60),
                            side: const BorderSide(width: 1.5, color: Colors.white),
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            shadowColor: Colors.white),
                        child: const Text("Trading activity",textAlign: TextAlign.center)),
                  ],
                ),
              ]
          ),
        ],
      ),
    );
  }
}