import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  String image;
  String title;
  String description;
  String body;
 

  PostPage({
    required this.image,
    required this.title,
    required this.description,
    required this.body

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Text'),
      // ),
      body: SafeArea(
        child: Column(
          children: [

            Hero(
            tag: 'pi', 
            child: Image.network(image) 
            
            ),
            Text(title),
            Text(description)

            
          ],
        ),
      ),
    );
  }
}
