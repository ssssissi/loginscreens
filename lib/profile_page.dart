
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:untitled/Stager.dart';
import 'package:untitled/Surbeck.dart';
import 'package:untitled/Mont.dart';
import 'package:untitled/calendar.dart';
import 'package:untitled/settings.dart';
import 'package:untitled/stocks.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}
class _MyProfileState extends State<MyProfile> {
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
            IconButton(icon: const Icon(Icons.info), onPressed:() {
            }),
            IconButton(icon: const Icon(Icons.settings), onPressed:() {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  const Settings()));
            }),
          ],
          title: const Text("PerfoRm"),
        ),
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
    'Hello again,\n Alma Rush',
    style: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),
    textAlign: TextAlign.center,
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
    children:[
        CircleAvatar(
          radius: 50,
          backgroundColor: const Color(
              0xff051b47),
          child: IconButton(
            iconSize: 50,
              color: Colors.white,
              onPressed: ()  {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Mont()),
                );
              },
              icon: const Icon(
                Icons.account_box,
              )),
        ),
              const Text("Rachael\nMontandon", style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center),
          ]),
          Column(
    children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: const Color(
                0xff051b47),
            child: IconButton(
              iconSize: 50,
                color: Colors.white,
                onPressed: ()  {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Stager()),
                  );
                },
                icon: const Icon(
                  Icons.account_box,
                )),
          ),
                const Text("Isabelle\nStager", style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center),
          ],
          ),
          Column(
    children:[
          CircleAvatar(
            radius: 50,
            backgroundColor: const Color(
                0xff051b47),
            child: IconButton(
              iconSize: 50,
                color: Colors.white,
                onPressed: ()  {
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => const Surbeck()),
                  );
                },
                icon: const Icon(
                  Icons.account_box,
                )),
          ),
                const Text("Peter\nSurbeck", style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center,),
              ],
          ),
          ],
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