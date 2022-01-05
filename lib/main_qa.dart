
import 'package:flutter/material.dart';

import 'app.dart';
import 'app/injection_setup.dart';


void main() async{
  DI.setup();
  await Future.delayed(Duration(milliseconds: 200));
  runApp(MyApp(flavor: 'QA',));
}