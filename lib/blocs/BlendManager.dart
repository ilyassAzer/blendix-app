import 'dart:async';

import 'package:app/models/Blend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash/dash.dart';

class BlendManager extends Bloc {
  Stream<QuerySnapshot> list$ =
      Firestore.instance.collection('blends').snapshots();

  Stream<List<Blend>> filteredList$(
      String application, List<String> essentialOils, List<String> emotions) {
    if (application == null && essentialOils == null && emotions == null) {
      return Firestore.instance.collection('blends').snapshots().map(
          (qs) => qs.documents.map((d) => Blend.fromJson(d.data)).toList());
    } else if (application == null && essentialOils == null) {
      return Firestore.instance.collection('blends').snapshots().map((qs) => qs
          .documents
          .map((d) => Blend.fromJson(d.data))
          .where((blend) => (blend.emotions.toSet().containsAll(emotions)))
          .toList());
    } else if (emotions == null && essentialOils == null) {
      return Firestore.instance.collection('blends').snapshots().map((qs) => qs
          .documents
          .map((d) => Blend.fromJson(d.data))
          .where((blend) => (blend.application.contains(application)))
          .toList());
    } else if (emotions == null && application == null) {
      return Firestore.instance.collection('blends').snapshots().map((qs) => qs
          .documents
          .map((d) => Blend.fromJson(d.data))
          .where((blend) =>
              (blend.ingredients.keys.toSet().containsAll(essentialOils)))
          .toList());
    } else if (emotions == null) {
      return Firestore.instance.collection('blends').snapshots().map((qs) => qs
          .documents
          .map((d) => Blend.fromJson(d.data))
          .where((blend) =>
              (blend.ingredients.keys.toSet().containsAll(essentialOils) &&
                  blend.application.contains(application)))
          .toList());
    } else if (essentialOils == null) {
      return Firestore.instance.collection('blends').snapshots().map((qs) => qs
          .documents
          .map((d) => Blend.fromJson(d.data))
          .where((blend) => (blend.emotions.toSet().containsAll(emotions) &&
              blend.application.contains(application)))
          .toList());
    } else if (application == null) {
      return Firestore.instance.collection('blends').snapshots().map((qs) => qs
          .documents
          .map((d) => Blend.fromJson(d.data))
          .where((blend) => (blend.emotions.toSet().containsAll(emotions) &&
              blend.ingredients.keys.toSet().containsAll(essentialOils)))
          .toList());
    } else {
      return Firestore.instance.collection('blends').snapshots().map(
          (qs) => qs.documents.map((d) => Blend.fromJson(d.data)).toList());
    }
  }

  static Bloc instance() => BlendManager();

  @override
  dispose() {}
}
