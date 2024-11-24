import 'package:flutter/material.dart';
import 'package:news_api/views/news_view.dart';

class MyNewsAPI extends StatelessWidget {
  const MyNewsAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeNewsAPI(),
    );
  }
}
