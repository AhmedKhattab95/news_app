import 'package:flutter/material.dart';

abstract class AppColors {
  /// ![](https://dummyimage.com/100x50/F4F6FF&text=F4F6FF)
  static const Color toolbarColor = Colors.black;

  /// ![](https://dummyimage.com/100x50/1166AA&text=1166AA)
  static const Color primaryColor = Colors.black;

  /// ![](https://dummyimage.com/100x50/2252AE&text=2252AE)
  static const Color primarydarkColor = Colors.black;

  /// ![](https://dummyimage.com/100x50/666666&text=666666)
  static const Color fontTextGrey = Color(0xff666666);

  /// ![](https://dummyimage.com/100x50/E9E9E9&text=E9E9E9)
  static const Color lightGrey = Color(0xffE9E9E9);

  static const Color lightColor = Colors.white;
  static const Color darkColor = Colors.black;

  static MaterialColor getMaterialColor(int hexa) {
    return MaterialColor(hexa, {
      50: Color(hexa),
      100: Color(hexa),
      200: Color(hexa),
      300: Color(hexa),
      400: Color(hexa),
      500: Color(hexa),
      600: Color(hexa),
      700: Color(hexa),
      800: Color(hexa),
      900: Color(hexa)
    });
  }
}
