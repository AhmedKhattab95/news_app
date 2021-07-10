import 'dart:convert';

import 'package:news_app/app/models/article.dart';
import 'package:news_app/app/models/base_article_response.dart';
import 'package:news_app/app/repositories/i_articles_repository.dart';
import 'package:news_app/core/core_lib.dart';

import 'managers_lib.dart';

class ArticleManager implements IArticleManager {
  final IArticlesRepository _articlesRepository;

  const ArticleManager(this._articlesRepository);

  @override
  Future<List<Article>> getAllArticles() async {
    ResponseModel? associatedPressArticles = null;
    ResponseModel? nextWebArticles = null;

    await Future.wait<void>([
      _articlesRepository
          .getArticeFromAssociatedPress()
          .then((result) => associatedPressArticles = result),
      _articlesRepository
          .getArticeFromNextWeb()
          .then((result) => nextWebArticles = result),
    ]);

    List<Article> articles = [];
    if (associatedPressArticles?.hasErrors() == false) {
      var result = BaseArticleResponse.fromJson(
              json.decode(associatedPressArticles?.body ?? ""))
          .articles;
      if (result != null) articles.addAll(result);
    }
    if (nextWebArticles?.hasErrors() == false) {
      var result =
          BaseArticleResponse.fromJson(json.decode(nextWebArticles?.body ?? ""))
              .articles;
      if (result != null) articles.addAll(result);
    }
    return articles;
  }
}
