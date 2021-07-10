import 'package:flutter/material.dart';
import 'package:news_app/app/Models/models_lib.dart';

class ArticleDetailPageView extends StatelessWidget {
  final Article article;

  ArticleDetailPageView(this.article, {Key? key}) : super(key: key);

  final pagePadding = EdgeInsets.symmetric(horizontal: 20 , vertical: 6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [HeaderImage(),
        Padding(padding: pagePadding,
        child: Text(
          article.title,

        ),)],
        
      ),
    );
  }

  Widget HeaderImage() {
    return FadeInImage(
        height: 150,
        width: double.infinity,
        image: NetworkImage(article.urlToImage),
        placeholder: AssetImage('asset url'));
  }
}
