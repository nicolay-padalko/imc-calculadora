import 'package:flutter/material.dart';

import '../constants.dart';

class ConteudoQuad extends StatelessWidget {
  ConteudoQuad({this.icone, this.label});

  final IconData icone;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icone,
          size: 60.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}
