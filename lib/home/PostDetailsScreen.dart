import 'package:app/models/Post.dart';
import 'package:flutter/material.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;

  const PostDetailsScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                post.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.fromLTRB(20,20,20,0),
                child: Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  post.body,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Montserrat'
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
