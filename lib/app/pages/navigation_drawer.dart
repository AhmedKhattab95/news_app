import 'package:flutter/material.dart';
import 'package:news_app/app/pages/articles_page/articles_page_view.dart';
import 'package:news_app/app/pages/empty_data_page/empty_data_page.dart';
import 'package:news_app/app/theme/app_assets.dart';
import 'package:news_app/app/theme/app_text.dart';
import 'package:news_app/core/extensions/extensions_lib.dart';
import 'package:news_app/app/utils/page_routes.dart';
import 'package:news_app/main.dart';

class navigationDrawer extends StatelessWidget {
  final double? imageSize = 25;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
            child: createDrawerHeader(),
          ),
          createDrawerBodyItem(
              icon: AppAssets.explore,
              text: AppText.articles.captalize(),
              onTap: () => _pushRoot(ArticlesPageView())),
          createDrawerBodyItem(
              icon: AppAssets.live,
              text: AppText.liveChat,
              onTap: () {
                _pushRoot(EmptyDataPageView(
                    AppText.liveChat, EmptyDataType.ServiceUnavilable));
              }),
          createDrawerBodyItem(
              icon: AppAssets.gallery,
              text: AppText.gallery.captalize(),
              onTap: () {
                _pushRoot(EmptyDataPageView(
                    AppText.gallery, EmptyDataType.NoItemsAvilable));
              }),
          createDrawerBodyItem(
              icon: AppAssets.wishlist,
              text: AppText.wishList,
              onTap: () {
                _pushRoot(EmptyDataPageView(
                    AppText.wishList, EmptyDataType.ServiceUnavilable));
              }),
          createDrawerBodyItem(
              icon: AppAssets.onlineNews,
              text: AppText.exploreOnlineNews,
              onTap: () {
                _pushRoot(EmptyDataPageView(
                    AppText.exploreOnlineNews, EmptyDataType.NoItemsAvilable));
              }),
        ],
      ),
    ));
  }

  Widget createDrawerHeader() {
    return Row(
      children: [
        ClipRRect(
          child: Image.asset(
            AppAssets.profile,
            height: 75,
            width: 75,
            fit: BoxFit.fill,
          ),
          borderRadius: new BorderRadius.circular(100.0),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppText.welcome.captalize()),
            SizedBox(
              height: 6,
            ),
            Text(
              'Tony Toshdy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }

  Widget createDrawerBodyItem(
      {required String icon, required String text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Image.asset(
            icon,
            height: imageSize,
            width: imageSize,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  void _pushRoot(Widget widget) {
    Navigator.pushAndRemoveUntil(
        navigatorKey.currentState!.context,
        MaterialPageRoute(builder: (BuildContext context) => widget),
        ModalRoute.withName('/'));
  }
}
