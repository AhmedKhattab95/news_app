import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final double iconSize;
  final String text;
  final double textSize;
  final IconData icon;
  final Color iconColor;

  const NoData(
      {this.iconSize = 50,
      this.icon = Icons.error,
      this.iconColor = Colors.redAccent,
      this.text = "No Data",
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
          Icon(icon, size: iconSize, color: iconColor),
          SizedBox(height: 10),
          Text(text, style: TextStyle(fontSize: textSize))
        ],
      ),
    );
  }
}
