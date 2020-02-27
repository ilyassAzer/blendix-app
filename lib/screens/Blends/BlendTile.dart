import 'package:app/screens/Blends/BlendDetailsScreen.dart';
import 'package:flutter/material.dart';

import 'package:app/models/Blend.dart';
import 'package:recase/recase.dart';

class BlendTile extends StatelessWidget {
  
  final Blend blend;
  const BlendTile({Key key, this.blend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ReCase(blend.name).headerCase),
      subtitle: Text(
        blend.description,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlendDetailsScreen(blend: blend,)
        ));
      },
    );
  }

  
}
