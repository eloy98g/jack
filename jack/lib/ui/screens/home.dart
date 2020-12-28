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
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      alignment: Alignment.center,
      child: InkWell(
        child: Container(
          child: Text(
            title,
            style: TextStyle(
              color: textPrimaryColor,
            ) 
          ),
        ),
        onTap: () => setState(() => _selectedIndex = index),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: textPrimaryColor,
            width: _selectedIndex == index ? 2.0 : 0,
          ),
        )
      )
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
    
      // body: _widgetOptions.elementAt(_selectedIndex),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: backgroundPrimaryColor,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       label: 'Partidas',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.place_outlined),
      //       label: 'Juegos',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.white,
      //   onTap: (index) => setState(() => _selectedIndex = index),
      // ),
    );
  }
}
