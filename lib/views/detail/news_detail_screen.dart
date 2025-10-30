import 'package:flutter/material.dart';
import 'package:news_app/views/detail/components/content.dart';
import 'package:news_app/views/detail/components/image_app_bar.dart';

class NewsDetailScreen  extends StatelessWidget {
  const NewsDetailScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView( // kalo pake ini jadi lebih bebas dibanding SingleChildScrollView
        slivers: [
          ImageAppBar(),
          Content()
        ],
      ),
    );
  }
}