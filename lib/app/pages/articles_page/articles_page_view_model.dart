import 'package:flutter/material.dart';
import 'package:news_app/app/managers/managers_lib.dart';
import 'package:news_app/app/models/models_lib.dart';

  class ArticlesPageViewModel extends ChangeNotifier {
  final IArticleManager _articleManager;

  ArticlesPageViewModel(this._articleManager);

  List<Article> _articles = [];

  List<Article> get articles => articles;

  Future<List<Article>> getAllArticles() async {
    var result = await _articleManager.getAllArticles();
    _articles = result;
    notifyListeners();
    return result;
  }

}
