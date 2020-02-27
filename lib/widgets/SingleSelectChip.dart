// * Packages
import 'package:flutter/material.dart';

class SingleSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(String) onSelectionChanged;

  SingleSelectChip(this.reportList, {this.onSelectionChanged});
  @override
  _SingleSelectChipState createState() => _SingleSelectChipState();
}

class _SingleSelectChipState extends State<SingleSelectChip> {
  String selectedChoice = "";
  // this function will build and return the choice list
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(
        Container(
          padding: const EdgeInsets.all(2.0),
          child: ChoiceChip(
            label: Text(item),
            selected: selectedChoice == item,
            onSelected: (selected) {
              setState(() {
                selectedChoice = item;
                widget.onSelectionChanged(selectedChoice);
              });
            },
          ),
        ),
      );
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: -7,
        spacing: 7,
        children: _buildChoiceList(),
    );
  }
}
