import 'package:flutter/material.dart';
import 'package:untitled/dataset.dart';
import 'package:untitled/profile_page.dart';
import 'package:untitled/settings.dart';
import 'package:untitled/stocks.dart';

import 'calendar.dart';

class Investment extends StatelessWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Stocks", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF020063),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.info), onPressed:() {
            }),
            IconButton(icon: const Icon(Icons.settings), onPressed:() {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  const Settings()));
            }),
          ],
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
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                color: const Color(0xFF020063),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),

              ),
            ),
            ListView(
              children: const [
                Recommended(),
              ],
            ),
          ],
        )
    );
  }
}

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Latest",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ],
          ),
          Column(

            children:[
              RecommendedItem(name: recommendedList[0].name,
                  subtitle: recommendedList[0].subtitle,
                  value:recommendedList[0].value,
                  icon:recommendedList[0].icon),
              RecommendedItem(name: recommendedList[1].name,
                  subtitle: recommendedList[1].subtitle,
                  value:recommendedList[1].value,
                  icon:recommendedList[1].icon),
              RecommendedItem(name: recommendedList[2].name,
                  subtitle: recommendedList[2].subtitle,
                  value:recommendedList[2].value,
                  icon:recommendedList[2].icon),
              RecommendedItem(name: recommendedList[3].name,
                  subtitle: recommendedList[3].subtitle,
                  value:recommendedList[3].value,
                  icon:recommendedList[3].icon),
              RecommendedItem(name: recommendedList[3].name,
                  subtitle: recommendedList[3].subtitle,
                  value:recommendedList[3].value,
                  icon:recommendedList[3].icon),

            ],
          ),


        ],
      ),
    );
  }
}
class RecommendedItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final String value;
  final String icon;
  const RecommendedItem({Key? key, required this.name,required this.subtitle,required this.value,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 0.2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width:60,
                height:60,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(image: AssetImage(icon))
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text(subtitle,style: const TextStyle(color: Colors.black54),)
                  ],
                ),
              )
            ],
          ),
          Container(
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
              ),
            ),
          )
        ],
      ),
    );
  }
}