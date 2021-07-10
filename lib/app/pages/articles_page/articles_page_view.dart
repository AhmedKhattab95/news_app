import 'package:flutter/material.dart';
import 'package:news_app/app/injection_setup.dart';
import 'package:news_app/app/managers/managers_lib.dart';
import 'package:news_app/app/pages/navigation_drawer.dart';
import 'package:news_app/app/shared_views/no_data.dart';
import 'package:news_app/core/managers/managers_lib.dart';
import 'package:news_app/core/views/loader.dart';
import 'package:news_app/app/theme/theme_lib.dart';
import 'package:news_app/app/utils/constants.dart';
import 'package:news_app/core/views/no_connection_view.dart';
import 'package:news_app/main.dart';
import 'package:provider/provider.dart';
import 'package:news_app/core/extensions/extensions_lib.dart';
import 'package:news_app/app/models/models_lib.dart';

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
              child: Stack(
                children: [_body(context, vm), ListView()],
              ),
              onRefresh: () => vm.refreshArticles());
        }));
  }

  Widget _articleCardDesign(BuildContext context, Article article) {
    return GestureDetector(
      onTap: () {
        //todo: navigate to details page
      },
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage(
                placeholder: AssetImage(AppAssets.placeholder),
                image: NetworkImage(article.urlToImage),
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  article.title,
                  style: AppTheme.CurrentTheme(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text(
                  '${AppText.by} ${article.author}',
                  style: AppTheme.CurrentTheme(context).textTheme.bodyText2,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      article.publishedAt
                          .formatToString(Constants.defaultDateFormat),
                      style: AppTheme.CurrentTheme(context).textTheme.bodyText2,
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
            ],
          ))),
    );
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

  Widget _body(BuildContext context, ArticlesPageViewModel vm) {
    if (!vm.connected) return NoConnectionView();
    if (vm.loading) return Loader();
    if (vm.articles.isEmpty) return NoData(iconSize: 70);
    return _articles(vm);
  }
}
