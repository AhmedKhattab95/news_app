import 'package:flutter/material.dart';
import 'package:news_app/app/managers/managers_lib.dart';
import 'package:news_app/app/models/models_lib.dart';
import 'package:news_app/core/core_lib.dart';

class ArticlesPageViewModel extends ChangeNotifier {
  final IArticleManager _articleManager;
  final IConnectivityManager _connectivityManager;

  bool _connected = true;

  bool get connected => _connected;

  ArticlesPageViewModel(this._articleManager, this._connectivityManager,
      WidgetsBinding? instance) {
    instance?.addPostFrameCallback((timeStamp) {
      getAllArticles();
    });
  }

  // static as if change VM object could keep data
  // todo can cache inside repository/manager
  static List<Article> _articles = [];

  List<Article> get articles => _articles;

  bool _loading = true;

  bool get loading => _loading;

  Future<List<Article>> getAllArticles() async {
    try {
      await _checkConnectivity();
      if (!connected) return articles;
      _loading = true;
      var result = await _getArticles();
      if (result != null && result.isNotEmpty) {
        _articles = result;
      }
    } catch (ex) {} finally {
      _loading = false;
      notifyListeners();
    }
    return articles;
  }

  Future<void> refreshArticles() async {
    getAllArticles();
  }

  Future<void> _checkConnectivity() async {
    _connected = await _connectivityManager.isConnected();
    notifyListeners();
  }

  Future<List<Article>> _getArticles() {
    return _articleManager.getAllArticles();
  }
}
