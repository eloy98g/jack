import 'package:flutter/material.dart';
import 'package:jack/ui/widgets/index.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.5, vertical: 18.0),
        child: Container(
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
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14.0,
                    color: textPrimaryColor,
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 23,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color:  Color(data.color),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Separator(),
                  Text(
                    'Canasta',
                    style: TextStyle(
                      color: textPrimaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Separator(),
                  Text(
                    '(12-12-20)',
                    style: TextStyle(
                      color: textPrimaryColor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),

            ],
          ),
          decoration: BoxDecoration( //wip
            border: Border.all(color: Colors.red),
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
            offset: Offset(2, 4),
          ),
        ],
      ),
    );
  }
}
