import 'package:app/blocs/ListManager.dart';
import 'package:app/blocs/Provider.dart';
import 'package:app/models/EssentialOil.dart';
import 'package:flutter/material.dart';

import 'essential_oil_tile.dart';


class EssentialOilDelegate extends SearchDelegate<EssentialOil> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listManager = $Provider.of<ListManager>();

    List<EssentialOil> list;

    return StreamBuilder(
      stream: listManager.filteredList$(filter: query),
      builder: (BuildContext context, snapshot) {
        list = snapshot.data;
        if (snapshot.hasError)
          return Center(child: new Text('Error: ${snapshot.error}'));
        if (snapshot.hasData) {
          return new ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return EssentialOilTile(essentialOil: list[index]);
            },
          );
        } else {
          return Center(child: Container());
        }
      },
    );
  }
}
