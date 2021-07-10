import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/app/managers/managers_lib.dart';
import 'package:news_app/app/repositories/articles_repository.dart';

void main() {
  group('articles page view model ', () {
    test('check articles retrived from api and not null', () async {
      IArticleManager _articleManager = ArticleManager(ArticlesRepository());
      var articles = await _articleManager.getAllArticles();
      var result = articles != null && articles.isNotEmpty;
      expect(result, true);
    });
  });
}
