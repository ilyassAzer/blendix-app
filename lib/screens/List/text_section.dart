import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String title;
  final Widget body;

  const TextSection({Key key, this.title, this.body}) : super(key: key);

  static const _hPad = 20.0; 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(_hPad, 20.0, _hPad, 4.0),
          child: Text(title, style: Theme.of(context).textTheme.title)
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, 0),
          child: body,
        ),
      ],
    );
  }
}