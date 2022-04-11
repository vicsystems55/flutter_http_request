import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  String title;

  PostPage({
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: Center(child: Text(title)),
    );
  }
}
