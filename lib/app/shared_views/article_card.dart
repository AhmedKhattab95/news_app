import 'package:flutter/material.dart';
import 'package:news_app/app/models/models_lib.dart';
import 'package:news_app/app/utils/constants.dart';
import 'package:news_app/core/core_lib.dart';
import 'package:news_app/app/theme/app_text.dart';
import 'package:news_app/app/theme/theme_lib.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final bool showDetails;

  ArticleCard(this.article, {this.showDetails = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _articleCardDesign(context, article);
  }

  double _pagePadding = 16.0;

  Widget _articleCardDesign(BuildContext context, Article article) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Card(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.bottomRight, children: [
              FadeInImage(
                placeholder: AssetImage(AppAssets.placeholder),
                image: NetworkImage(article.urlToImage),
                imageErrorBuilder: (cxt, error, st) => Image.asset(
                    AppAssets.placeholder,
                    height: 200,
                    width: double.infinity),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Visibility(
                visible: showDetails,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.publishedAt
                        .formatToString(Constants.defaultDateFormat),
                    style: AppTheme.CurrentTheme(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.lightColor),
                    textAlign: TextAlign.end,
                  ),
                ),
              )
            ]),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(_pagePadding),
              child: Text(
                article.title,
                style: AppTheme.CurrentTheme(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _pagePadding, vertical: 0),
              child: Text(
                '${AppText.by.captalize()} ${article.author}',
                style: AppTheme.CurrentTheme(context).textTheme.bodyText2,
                textAlign: TextAlign.start,
              ),
            ),
            Visibility(
              visible: showDetails,
              child: Padding(
                padding: EdgeInsets.all(_pagePadding),
                child: Text(
                  article.description,
                  style: AppTheme.CurrentTheme(context).textTheme.bodyText2,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Visibility(
              visible: !showDetails,
              child: Padding(
                padding: EdgeInsets.all(_pagePadding),
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
            ),
          ],
        )));
  }
}
