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
                return GestureDetector(
                  onTap: (){

                    Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context)=>
                                   PostPage(
                                     image: '${posts![index].featuredImage}',
                                     title: '${posts![index].postTitle}??' '',

                                     description: '${posts![index].postDescription}',
                                     body: '${posts![index].postBody}',

                                   )
                                   )
                                 );


                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Hero(
                        tag: 'pi',
                        child: Image.network('${posts![index].featuredImage}')),
                      Card(
                        child: ListTile(
                          title: Text('${posts![index].postTitle}??' ''),
                          subtitle: Text('${posts![index].postDescription}'),
                        ),
                      ),
                      
                      Text('${posts![index].postAuthors?.name}'),

                      Text('${posts![index].postCategories?.name}')
                    ],
                  ),
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
