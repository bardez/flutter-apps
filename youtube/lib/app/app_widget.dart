import 'package:flutter/material.dart';
import 'package:youtube/app/modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Youtube",
    );
  }
}
