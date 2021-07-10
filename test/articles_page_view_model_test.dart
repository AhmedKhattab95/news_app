import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app/injection_setup.dart';
import 'package:news_app/app/managers/managers_lib.dart';
import 'package:news_app/app/pages/articles_page/articles_page_view_model.dart';
import 'package:news_app/app/repositories/articles_repository.dart';
import 'package:news_app/core/extensions/extensions_lib.dart';

void main() {
  group('articles page view model ', () {
    test('check articles retrived from api and not null', () async {
      var vm = ArticlesPageViewModel(ArticleManager(ArticlesRepository()));
      var articles = await vm.getAllArticles();
      var result = articles != null && articles.isNotEmpty;
      expect(result, true);
    });

  });
}
