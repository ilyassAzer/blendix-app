import 'dart:async';

import 'package:app/models/EssentialOil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash/dash.dart';

enum orderby {DESC, ASC}



class ListManager extends Bloc {
  
  final CollectionReference essentialOils = Firestore.
  instance.collection('essentialoils');

  Stream<QuerySnapshot> list$(orderby order) => essentialOils
  .orderBy('name', descending: order != orderby.ASC)
  .snapshots();


  Stream<List<EssentialOil>> filteredList$({String filter}) => essentialOils.
  snapshots()
  .map((qs) => qs.documents
    .map((d) => EssentialOil.fromJson(d.data))
    .where((eo) => (
      eo.name.toLowerCase().contains(filter) || 
      eo.latinName.toLowerCase().contains(filter) || 
      eo.scent.toLowerCase().contains(filter)
    )).toList()
  );


  StreamController<orderby> _orderController = StreamController<orderby>.broadcast();

  Stream<orderby> get order$ => _orderController.stream; 
  order(orderby value) {
    _orderController.sink.add(value); 
    print(value);
  }
  
  static Bloc instance() => ListManager();

  @override
  dispose() {
    _orderController.close();
  }
  
}