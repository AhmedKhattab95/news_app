import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/theme/app_assets.dart';

class NoConnectionView extends StatelessWidget {
  final String text;
  final double textSize;
  final Widget? icon;

  const NoConnectionView({this.icon,
    this.text = "No Internet Connection",
    this.textSize = 28,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? Image.asset(
              AppAssets.satellite,
              height: 100,
              width: 100,
              fit: BoxFit.cover
          ),
          SizedBox(height: 10),
          Text(text, style: TextStyle(fontSize: textSize))
        ],
      ),
    );
  }
}
