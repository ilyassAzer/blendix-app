import 'package:app/blocs/ListManager.dart';
import 'package:app/blocs/Provider.dart';
import 'package:app/custom_icons_icons.dart';
import 'package:app/models/EssentialOil.dart';
import 'package:app/screens/List/EssentialOilDelegate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'essential_oil_tile.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final listManager = $Provider.of<ListManager>();

  @override
  void dispose() {
    super.dispose();
    listManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Essential Oils',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Icon(
          CustomIcons.menu,
          color: Colors.black,
          size: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              CustomIcons.search__1_,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () {
              showSearch(context: context, delegate: EssentialOilDelegate());
            },
          ),
          StreamBuilder<orderby>(
              stream: listManager.order$,
              initialData: orderby.ASC,
              builder: (context, snapshot) {
                return PopupMenuButton<orderby>(
                  icon: Icon(
                      CustomIcons
                          .more_button_of_three_circles_outlines_in_vertical,
                      size: 22,
                      color: Colors.black),
                  onSelected: (value) {
                    listManager.order(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Text('ORDER BY NAME'),
                        enabled: false,
                      ),
                      CheckedPopupMenuItem(
                        child: Text('ASCENDANT'),
                        value: orderby.ASC,
                        checked: (snapshot.data == orderby.ASC),
                      ),
                      PopupMenuDivider(),
                      CheckedPopupMenuItem(
                        child: Text('DESCENDANT'),
                        value: orderby.DESC,
                        checked: (snapshot.data == orderby.DESC),
                      ),
                    ];
                  },
                );
              })
        ],
      ),
      body: StreamBuilder(
        stream: listManager.order$,
        initialData: orderby.ASC,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          orderby current = snapshot.data;
          return StreamBuilder<QuerySnapshot>(
            stream: listManager.list$(current),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              if (snapshot.hasData) {
                return new ListView.separated(
                  itemCount: snapshot.data.documents.length,
                  separatorBuilder: (context, int pos){
                    return Divider();
                  },
                  itemBuilder: (context, index) {
                    final EssentialOil eo = EssentialOil.fromJson(
                        snapshot.data.documents[index].data);
                    return EssentialOilTile(essentialOil: eo);
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
