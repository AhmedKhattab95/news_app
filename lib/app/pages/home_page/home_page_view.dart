import 'package:flutter/material.dart';
import 'package:news_app/app/theme/app_text.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.articles.toUpperCase()),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Container();
      }),
    );
  }
}
