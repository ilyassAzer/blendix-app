import 'package:app/models/Post.dart';
import 'package:flutter/material.dart';

import 'PostDetailsScreen.dart';

class HorizontalCard extends StatelessWidget {
  final Post post;

  const HorizontalCard({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PostDetailsScreen(post: post,)
        ));
      },
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7.0),
        width: 100,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                image: DecorationImage(
                  image: NetworkImage(post.imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black38, BlendMode.overlay)
                ),
              ),
            ),
            ListTile(
              title: Text(
                post.title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 17,
                  backgroundColor: Colors.black54,
                  fontWeight: FontWeight.w600
                ),
              ),
              subtitle: Text(
                post.body,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w300
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
