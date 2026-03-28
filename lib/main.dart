import 'package:flutter/material.dart';
import 'package:item_flow/models/Item_flow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Itemflow();
  }
}
