import 'package:flutter/material.dart';

import '../constants.dart';

class BotaoInferior extends StatelessWidget {
  BotaoInferior({@required this.onTap, @required this.textoBotao});

  final Function onTap;
  final String textoBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kContainerInferior,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            textoBotao,
            style: kTextoBotaoStyle,
          ),
        ),
      ),
    );
  }
}
