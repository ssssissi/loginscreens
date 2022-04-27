import 'package:flutter/material.dart';
import 'package:untitled/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

   const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        backgroundColor: const Color(0xff051b47),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage != null ?
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ) :
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage('https://source.unsplash.com/weekly?coding'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: const Color(0xFF020063),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.source.name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.description,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}