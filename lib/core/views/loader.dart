import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double size;

  const Loader({this.size = 50, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
        height: size,
        width: size,
      ),
    );
  }
}
