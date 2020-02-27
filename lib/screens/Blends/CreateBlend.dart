import 'package:app/models/Blend.dart';
import 'package:app/widgets/MultiSelectChip.dart';
import 'package:app/widgets/SingleSelectChip.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/suggestions.dart' as suggestions;

class CreateBlend extends StatefulWidget {
  CreateBlend({Key key}) : super(key: key);
  _CreateBlendState createState() => _CreateBlendState();
}

class _CreateBlendState extends State<CreateBlend> {
  final TextEditingController eoController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final eoKey = GlobalKey<AutoCompleteTextFieldState<String>>();

  final TextEditingController bController = TextEditingController();
  final bKey = GlobalKey<AutoCompleteTextFieldState<String>>();

  Map<String, int> essentialOils = {};
  Map<String, int> baseOils = {};
  List<String> emotions = [];
  String application;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Create Blend',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: <Widget>[
            Container(
              height: 50,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Blend name here',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: descController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Description here',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 50,
                    child: SimpleAutoCompleteTextField(
                      suggestions: suggestions.ESSENTIAL_OILS,
                      controller: eoController,
                      clearOnSubmit: true,
                      textSubmitted: (key) {
                        if (!essentialOils.containsKey(key) && suggestions.ESSENTIAL_OILS.contains(key)) {
                          setState(() {
                            essentialOils.addAll({
                              key: 0,
                            });
                          });
                        }
                      },
                      key: eoKey,
                      decoration: InputDecoration(
                        hintText: 'Enter essential oil',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    color: Colors.blueGrey[900],
                    textColor: Colors.white,
                    onPressed: () {
                      if (eoController.text.isNotEmpty && suggestions.ESSENTIAL_OILS.contains(eoController.text)) {
                        setState(() {
                          essentialOils.addAll({
                            eoController.text: 0,
                          });
                        });
                        eoController.clear();
                      }
                    },
                    child: Text('Add'),
                  ),
                  width: 60,
                  height: 50,
                ),
              ],
            ),
            SizedBox(height: 5),
            Column(children: getWidgets(essentialOils)),
            SizedBox(height: 10),
            application == 'Massage'
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 50,
                          child: SimpleAutoCompleteTextField(
                            suggestions: suggestions.BASE_OILS,
                            controller: bController,
                            clearOnSubmit: true,
                            textSubmitted: (key) {
                              if (!baseOils.containsKey(key)  && suggestions.BASE_OILS.contains(key)) {
                                setState(() {
                                  baseOils.addAll({
                                    key: 0,
                                  });
                                });
                              }
                            },
                            key: bKey,
                            decoration: InputDecoration(
                              hintText: 'Enter base oil',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          color: Colors.blueGrey[900],
                          textColor: Colors.white,
                          onPressed: () {
                            if (bController.text.isNotEmpty  && suggestions.BASE_OILS.contains(bController.text)) {
                              setState(() {
                                baseOils.addAll({
                                  bController.text: 0,
                                });
                              });
                              print(baseOils['${bController.text}']);
                              baseOils.clear();
                            }
                          },
                          child: Text('Add'),
                        ),
                        width: 60,
                        height: 50,
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: 5),
            Column(children: getWidgets(baseOils)),
            SizedBox(height: 5),
            Text(
              'Applications',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 19,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 5),
            SingleSelectChip(
              suggestions.APPLICATIONS,
              onSelectionChanged: (app) {
                setState(() {
                  application = app;
                });
              },
            ),
            Text(
              'Emotions',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 19,
                fontWeight: FontWeight.w300,
              ),
            ),
            MultiSelectChip(
              suggestions.EMOTIONS,
              onSelectionChanged: (emotions) {
                setState(() {
                  emotions = emotions;
                });
              },
            ),
            SizedBox(height: 10),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  color: Colors.redAccent[700],
                  textColor: Colors.white,
                  onPressed: () {
                    Blend blend = Blend(
                      nameController.text,
                      descController.text,
                      essentialOils,
                      emotions,
                      application,
                    );
                    Firestore.instance.collection('blends').add(blend.toJson());
                    Navigator.of(context).pop(context);
                  },
                  child: Text('Add Blend'),
                ),
                height: 45),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  List<Dismissible> getWidgets(Map<String, int> map) {
    List<Dismissible> widgets = [];
    map.forEach((String key, int value) {
      widgets.add(
        Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            map.remove(key);
          },
          child: ListTile(
            title: Text(
              key,
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontFamily: 'Montserrat'),
            ),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  color: Colors.blueGrey[900],
                  icon: Icon(Icons.remove_circle),
                  iconSize: 35,
                  onPressed: () {
                    setState(() {
                      if (value > 0) {
                        map[key] = value - 1;
                      }
                    });
                  },
                ),
                Text(
                  value.toString(),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                IconButton(
                  color: Colors.blueGrey[900],
                  icon: Icon(Icons.add_circle),
                  iconSize: 35,
                  onPressed: () {
                    setState(() {
                      map[key] = value + 1;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      );
    });

    return widgets;
  }
}
