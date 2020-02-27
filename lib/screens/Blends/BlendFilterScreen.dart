import 'package:app/widgets/MultiSelectChip.dart';
import 'package:app/widgets/SingleSelectChip.dart';
import 'package:flutter/material.dart';

import '../../utils/suggestions.dart' as suggestions;

class BlendFilterScreen extends StatefulWidget {
  BlendFilterScreen({Key key}) : super(key: key);
  _BlendFilterScreenState createState() => _BlendFilterScreenState();
}

class _BlendFilterScreenState extends State<BlendFilterScreen> {

  List<dynamic> filterList = List(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('FILTER'),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Text(
              "Save",
              style: TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.pop(context, filterList);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Text('Application', style: Theme.of(context).textTheme.title,),
            SingleSelectChip(
              suggestions.APPLICATIONS,
              onSelectionChanged: (app){
                filterList[0] = app;
              },
            ),
            Text('Emotions', style: Theme.of(context).textTheme.title,),
            MultiSelectChip(
              suggestions.EMOTIONS,
              onSelectionChanged: (emotions){
                filterList[2] = emotions;
              },
            ),
            Text('Essential oil', style: Theme.of(context).textTheme.title,),
            MultiSelectChip(
              suggestions.ESSENTIAL_OILS,
              onSelectionChanged: (esssentialOils){
                filterList[1] = esssentialOils;
              },
            ),
          ],
        ),
      ),
    );
  }
}
