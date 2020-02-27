import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash/dash.dart';

class PostManager extends Bloc {
  
  final CollectionReference posts = Firestore.
  instance.collection('posts');

  Stream<QuerySnapshot> posts$() => posts.snapshots();
  
  static Bloc instance() => PostManager();

  @override
  dispose() {
  }

}