import 'package:app/models/Blend.dart';
import 'package:app/screens/List/text_section.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class BlendDetailsScreen extends StatefulWidget {
  final Blend blend;

  BlendDetailsScreen({Key key, this.blend}) : super(key: key);

  _BlendDetailsScreenState createState() => _BlendDetailsScreenState();
}

class _BlendDetailsScreenState extends State<BlendDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          ReCase(widget.blend.name).headerCase,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height: 250.0,
            ),
            decoration: BoxDecoration(color: Colors.grey),
            child: Image.network(
              'https://static.onecms.io/wp-content/uploads/sites/35/2018/09/03210415/fb-lemon-essential-oil.jpg',
              fit: BoxFit.cover,
            ),
          ),
          TextSection(
            title: 'INGREDIENTS',
            body: Column(
                children: widget.blend.ingredients.entries.map((entry) {
              return ListTile(
                title: Text(
                  entry.key,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: Colors.black54
                  ),
                ),
                trailing: Text(
                  entry.value.toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 19
                  ),
                ),
              );
            }).toList()),
          ),
          Divider(),
          TextSection(
              title: 'APPLICATION', body: Text(widget.blend.application)),
          Divider(),
          TextSection(
              title: 'EMOTIONS', body: Text(widget.blend.emotions.join(', '))),
          Divider(),
          TextSection(
            title: 'DESCRPTION',
            body: Text(
              widget.blend.description.toLowerCase(),
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ],
      ),
    );
  }
}
