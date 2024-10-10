import 'package:flip/cart.dart';
import 'package:flip/page1.dart';
import 'package:flip/product.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  final mybox = await Hive.openBox('mybox');
  runApp(MaterialApp(
    home: Page1(),
    routes: {
      "pro": (context) => Page2(),
      "cart":(context)=>Page3()
    },
  ));
}
