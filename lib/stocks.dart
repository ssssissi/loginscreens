import 'package:untitled/investments.dart';
import 'package:untitled/customListTile.dart';
import 'package:untitled/article_model.dart';
import 'package:untitled/api_service.dart';
import 'package:flutter/material.dart';
import 'package:untitled/calendar.dart';
import 'package:untitled/profile_page.dart';
import 'package:untitled/settings.dart';

class Stocks extends StatefulWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  _StocksState createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business News", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF020063),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) =>  const MyProfile()));
        },),
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
            FloatingActionButton(child: const Icon(Icons.account_circle,
                size: 50,
                color: Color(0xff051b47)),
                backgroundColor: Colors.white,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const MyProfile()));
                }),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  const Stocks()));
            }, icon: const Icon(Icons.analytics, color: Colors.white, size: 32)),
          ],
        ),
      ),
      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Investment()),
          );
        },
        label: const Text('Check Stocks'),
        icon: const Icon(Icons.arrow_forward_ios),
        backgroundColor: const Color(0xFF020063),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}