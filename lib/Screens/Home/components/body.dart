import 'package:blog_flutter/Models/post_modal.dart';
import 'package:blog_flutter/components/post_container.dart';
import 'package:blog_flutter/controllers/homeController.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> _refreshData() async {
    // Yenileme işlemi için asenkron bir işlev
    setState(() {
      // Verileri sıfırla veya güncelle
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var posts = snapshot.data!;
            return SafeArea(
              child: Container(
                height: size.height,
                width: double.infinity,
                child: ListView(
                  children: [
                    for (var post in posts)
                      PostContainer(
                        postUser: "Oğuzhantuğrul Akçay",
                        title: post.Title,
                        body: post.Body,
                        commentCount: post.CommentCount,
                        createdAt: DateTime.parse(post.CreatedAt),
                        likeCount: post.LikeCount,
                        isLiked: post.IsLiked == "false" ? false : true,
                      ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('An error occurred while fetching posts.');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
