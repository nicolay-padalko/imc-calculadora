import 'package:bmi_calculator/components/botaoInferior.dart';
import 'package:bmi_calculator/components/botaoRedondo.dart';
import 'package:bmi_calculator/components/card_reutil.dart';
import 'package:bmi_calculator/components/conteudo_icone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../screens/calculadora_logica.dart';
import 'results_page.dart';

enum Genero { macho, femea }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genero generoSelecionado;
  int height = 180;
  int peso = 80;
  int idade = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        generoSelecionado = Genero.macho;
                      });
                    },
                    colour: generoSelecionado == Genero.macho
                        ? kCartaoAtivo
                        : kCartInativo,
                    cardChild: ConteudoQuad(
                      icone: FontAwesomeIcons.mars,
                      label: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        generoSelecionado = Genero.femea;
                      });
                    },
                    colour: generoSelecionado == Genero.femea
                        ? kCartaoAtivo
                        : kCartInativo,
                    cardChild: ConteudoQuad(
                      icone: FontAwesomeIcons.venus,
                      label: 'FEMININO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kCartaoAtivo,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ALTURA',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumbersTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kCartaoAtivo,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PESO',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          peso.toString(),
                          style: kNumbersTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BotaoRedondo(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            BotaoRedondo(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  peso++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kCartaoAtivo,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'IDADE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          idade.toString(),
                          style: kNumbersTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BotaoRedondo(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  idade--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotaoRedondo(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  idade++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            textoBotao: 'CALCULAR',
            onTap: () {
              CauladoraLogica calc =
                  CauladoraLogica(altura: height, peso: peso);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculoBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpertration(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
