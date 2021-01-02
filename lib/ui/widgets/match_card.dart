import 'package:flutter/material.dart';
import 'package:jack/utils/index.dart';

import '../../models/index.dart';


class MatchCard extends StatelessWidget {
  final Match data;

  const MatchCard(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      child: Card(
        color: backgroundPrimaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.5, vertical: 18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Text(
                              data.name,
                              style: TextStyle(
                                color: textPrimaryColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(

              )
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: backgroundPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
