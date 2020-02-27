// * Packages
import 'package:app/blocs/PostManager.dart';
import 'package:app/blocs/Provider.dart';
import 'package:app/home/HorizontalCard.dart';
import 'package:app/models/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'List/text_section.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final postManager = $Provider.of<PostManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextSection(
              title: 'BLENDS',
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5.0),
                height: 170,
                child: StreamBuilder<QuerySnapshot>(
                  stream: postManager.posts$(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                        print(snapshot.data);
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          final Post post = Post.fromJson(
                              snapshot.data.documents[index].data);
                          return HorizontalCard(post: post);
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )),
                TextSection(
              title: 'POSTS',
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5.0),
                height: 170,
                child: StreamBuilder<QuerySnapshot>(
                  stream: postManager.posts$(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                        print(snapshot.data);
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          final Post post = Post.fromJson(
                              snapshot.data.documents[index].data);
                          return HorizontalCard(post: post);
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )),
                TextSection(
              title: 'WISHLIST',
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5.0),
                height: 170,
                child: StreamBuilder<QuerySnapshot>(
                  stream: postManager.posts$(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                        print(snapshot.data);
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          final Post post = Post.fromJson(
                              snapshot.data.documents[index].data);
                          return HorizontalCard(post: post);
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
