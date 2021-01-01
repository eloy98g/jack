import 'package:flutter/material.dart';

import '../../utils/index.dart';
import '../tabs/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Matches(),
    Games(),
  ];

  Widget appBarButton(String title, int index){
    return InkWell(
      excludeFromSemantics: true,
      child: Container(
        decoration:  _selectedIndex == index ? BoxDecoration(
          border: Border(
            bottom:  BorderSide(
              color: textPrimaryColor,
              width: 2.0
            )
          )
        ) : BoxDecoration(), 
        width: MediaQuery.of(context).size.width / 2,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: textPrimaryColor,
          ) 
        ),
      ),
      onTap: () => setState(() => _selectedIndex = index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundSecondaryColor,
      appBar: AppBar(
        backgroundColor: backgroundPrimaryColor,
        actions: [
          Row(
            children: [
              appBarButton('Partidas', 0),
              appBarButton('Juegos', 1),
            ],
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
