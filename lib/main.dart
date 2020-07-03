import 'package:flutter/material.dart';
import 'package:mobile_shopping_platform/pages/index_page.dart';

main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "ForU Shop",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: IndexPage(),
      ),
    );
  }
}
