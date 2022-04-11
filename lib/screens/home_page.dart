import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:httpz/models/post_model.dart';
import 'package:httpz/screens/post_page.dart';
// import 'package:httpz/repositories/post.dart';
import 'package:httpz/repositories/api_posts.dart';

// import '../models/albums_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  fetchAlbum() async {
    posts = await PostzService().fetchPosts();

    print(posts);

    if (posts != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Visibility(
          visible: isLoading,
          child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.network('${posts![index].featuredImage}'),
                    Card(
                      child: ListTile(
                        title: Text('${posts![index].postTitle}??' ''),
                        subtitle: Text('${posts![index].postDescription}'),
                      ),
                    ),
                    Text('${posts![index]}')
                  ],
                );
              }),
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
        ),

        // body: Center(
        //   child: FutureBuilder<List<Album>>(
        //     future: futureAlbum,
        //     builder: ((context, snapshot) {
        //        if (snapshot.hasData) {
        //           return ListView.builder(
        //             itemCount: futureAlbum.toString().length,
        //             itemBuilder: (context, index){
        //               return ListTile(
        //                 title: Text('WE')
        //               );
        //           });
        //         } else if (snapshot.hasError) {
        //           return Text('${snapshot.error}');
        //         }

        //         return const CircularProgressIndicator();
        //     })

        //     ),
        // ),
      ),
    );
  }
}
