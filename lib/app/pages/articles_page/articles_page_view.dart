import 'package:flutter/material.dart';
import 'package:news_app/app/managers/managers_lib.dart';
import 'package:news_app/app/models/models_lib.dart';
import 'package:news_app/app/pages/article_detail_page/article_detail_page_view.dart';
import 'package:news_app/app/pages/navigation_drawer.dart';
import 'package:news_app/app/shared_views/article_card.dart';
import 'package:news_app/app/shared_views/no_data.dart';
import 'package:news_app/core/core_lib.dart';
import 'package:news_app/app/theme/theme_lib.dart';
import 'package:news_app/main.dart';
import 'package:provider/provider.dart';

import 'articles_page_view_model.dart';

class ArticlesPageView extends StatelessWidget {
  static const String routeName = '/articlesPage';

  ArticlesPageView({Key? key}) : super(key: key) {}

  final pagePadding = EdgeInsets.symmetric(horizontal: 20, vertical: 6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: navigationDrawer(),
        appBar: AppBar(
          title: Text(AppText.articles.toUpperCase()),
        ),
        body: _bodyDesign(context));
  }

  Widget _bodyDesign(BuildContext context) {
    return ChangeNotifierProvider<ArticlesPageViewModel>(
        create: (context) => ArticlesPageViewModel(DI.get<IArticleManager>(),
            DI.get<IConnectivityManager>(), WidgetsBinding.instance),
        child: Consumer<ArticlesPageViewModel>(builder: (cxt, vm, _) {
          return RefreshIndicator(
              child: _body(context, vm), onRefresh: () => vm.refreshArticles());
        }));
  }

  Widget _body(BuildContext context, ArticlesPageViewModel vm) {
    if (!vm.connected && vm.articles.isEmpty)
      return _wrapWithStackAndListView(NoConnectionView());
    if (vm.loading) return Loader();
    if (vm.articles.isEmpty) return NoData(iconSize: 70);
    return _articles(vm);
  }

  Widget _articles(ArticlesPageViewModel vm) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var article = vm.articles[index];
        return _articleCardDesign(context, article);
      },
      itemCount: vm.articles.length,
    );
  }

  Widget _articleCardDesign(BuildContext context, Article article) {
    return GestureDetector(
      onTap: () {
        // navigate to details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPageView(article),
          ),
        );
      },
      child: ArticleCard(
        article,
        showDetails: false,
      ),
    );
  }

  /// this will wrap widget with stack and lsitview to enable pull to refresh
  Widget _wrapWithStackAndListView(Widget widget) {
    return Stack(
      children: [widget, ListView()],
    );
  }
}
