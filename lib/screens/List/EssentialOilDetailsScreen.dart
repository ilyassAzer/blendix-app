import 'package:app/models/EssentialOil.dart';
import 'package:app/screens/List/text_section.dart';
import 'package:flutter/material.dart';

class EssentialOilDetailsScreen extends StatefulWidget {
  final EssentialOil essentialOil;
  const EssentialOilDetailsScreen({Key key, this.essentialOil})
      : super(key: key);

  _EssentialOilDetailsScreenState createState() =>
      _EssentialOilDetailsScreenState();
}

class _EssentialOilDetailsScreenState extends State<EssentialOilDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.essentialOil.name.toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
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
                widget.essentialOil.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            TextSection(
              title: widget.essentialOil.name.toUpperCase(),
              body: Text(
                widget.essentialOil.latinName.toUpperCase(),
                textAlign: TextAlign.justify,
                style:TextStyle(fontSize: 15)
                //style: Theme.of(context).textTheme.body1,
              ),
            ),
            TextSection(
              title: 'SCENT',
              body: Text(
                widget.essentialOil.scent,
                textAlign: TextAlign.justify,
                style:TextStyle(fontSize: 15)
                //style: Theme.of(context).textTheme.body1,
              ),
            ),
            TextSection(
              title: 'NOTE',
              body: Text(
                widget.essentialOil.note,
                textAlign: TextAlign.justify,
                style:TextStyle(fontSize: 15)
                //style: Theme.of(context).textTheme.body1,
              ),
            ),
            TextSection(
              title: 'DESCRIPTION',
              body: Text(
                widget.essentialOil.description,
                textAlign: TextAlign.justify,
                style:TextStyle(fontSize: 15)
                //style: Theme.of(context).textTheme.body1,
              ),
            ),
            TextSection(
              title: 'ORIGIN',
              body: Text(
                widget.essentialOil.origin.join(', '),
                textAlign: TextAlign.justify,
                style:TextStyle(fontSize: 15)
                //style: Theme.of(context).textTheme.body1,
              ),
            ),
            TextSection(
              title: 'POTENTIAL USES',
              body: Text(
                widget.essentialOil.potentialUses.join(', '),
                textAlign: TextAlign.justify,
                style:TextStyle(fontSize: 15)
                //style: Theme.of(context).textTheme.body1,
              ),
            ),
            TextSection(
              title: 'BLENDS WELL WITH',
              body: Text(
                widget.essentialOil.blendsWith.join(', '),
                textAlign: TextAlign.justify,
                style:TextStyle(fontSize: 15)
                //style: Theme.of(context).textTheme.body1,
              ),
            ),
            TextSection(
              title: 'SAFE USE',
              body: Text(
                widget.essentialOil.safeUse,
                textAlign: TextAlign.justify,
                style:TextStyle(fontSize: 15)
                //style: Theme.of(context).textTheme.body1,
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ));
  }
}
