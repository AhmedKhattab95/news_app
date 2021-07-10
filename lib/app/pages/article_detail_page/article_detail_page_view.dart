import 'package:flutter/material.dart';
import 'package:news_app/app/models/models_lib.dart';
import 'package:news_app/app/shared_views/article_card.dart';
import 'package:news_app/app/theme/app_text.dart';
import 'package:news_app/app/theme/theme_lib.dart';
import 'package:news_app/core/extensions/extensions_lib.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPageView extends StatelessWidget {
  final Article article;

  ArticleDetailPageView(this.article, {Key? key}) : super(key: key);

  final pagePadding = EdgeInsets.symmetric(horizontal: 20, vertical: 6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.articleDetails),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArticleCard(
              article,
              showDetails: true,
            ),
            _button()
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {
          _launchURL(article.url);
        },
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Center(child: Text(AppText.openWebSite.toUpperCase())),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    // todo: should be moved to core lib and as helper/manager
    if (!url.isNullOrWhiteSpace()) {
      await launch(url.trim());
    }
  }
}
