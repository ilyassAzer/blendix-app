import 'package:flutter/material.dart';

import 'package:app/models/EssentialOil.dart';
import 'package:app/screens/List/EssentialOilDetailsScreen.dart';

class EssentialOilTile extends StatelessWidget {
  final EssentialOil essentialOil;
  const EssentialOilTile({Key key, this.essentialOil}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(essentialOil.name),
      subtitle: Text(essentialOil.latinName),
      leading: CircleAvatar(
        child: Text(
          essentialOil.scent[0],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900
          ),
        ),
        backgroundColor: familyColor(essentialOil.scent),
      ),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
            EssentialOilDetailsScreen(essentialOil: essentialOil)
          )
        );
      },
    );
  }

  Color familyColor(String family) {
    switch (family.toLowerCase()) {
      case 'floral':
        return Colors.pink;
      case 'citrus':
        return Colors.yellow;
      case 'herbaceous':
        return Colors.green[600];
      case 'spicy':
        return Colors.brown[600];
      default:
        return Colors.grey;
    }
  }
}
