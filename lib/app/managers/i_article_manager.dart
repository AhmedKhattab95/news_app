import 'package:news_app/app/models/models_lib.dart';

abstract class IArticleManager {
  Future<List<Article>> getAllArticles();
}
