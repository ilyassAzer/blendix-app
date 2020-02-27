import 'package:app/blocs/BlendManager.dart';
import 'package:app/blocs/Provider.dart';
import 'package:app/models/Blend.dart';
import 'package:app/screens/Blends/BlendFilterScreen.dart';
import 'package:app/screens/Blends/BlendTile.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/Blends/CreateBlend.dart';

class BlendScreen extends StatefulWidget {
  BlendScreen({Key key}) : super(key: key);

  _BlendScreenState createState() => _BlendScreenState();
}

class _BlendScreenState extends State<BlendScreen> {
  final BlendManager blendManager = $Provider.of<BlendManager>();
  
  List<dynamic> filters = List(3);

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Blends',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black,),
            onPressed: () async {
              filters = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BlendFilterScreen()),
              );
              print(filters);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateBlend()),
          );
        },
        backgroundColor: Colors.redAccent[700],
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: blendManager.filteredList$(filters[0], filters[1], filters[2]),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            List<Blend> list = snapshot.data;
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (context, pos){
                  return Divider();
                },
                itemBuilder: (context, index) {
                  return BlendTile(blend: list[index]);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
    );
  }
}
