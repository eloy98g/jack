import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double width, height;

  const Separator({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Color(0x00000000),
    );
  }
}
