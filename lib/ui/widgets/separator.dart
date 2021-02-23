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

/*
import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double width, height;
  final Color color;

  const Separator({
    Key key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bool hasBorder = color != null;
    return Container(
      width: width,
      height: height,
      color: Color(0x00000000),
      decoration: BoxDecoration(
        border: Border.all(
          color: hasBorder
            ? color
            : Color(0x00000000),
          width: 1,
        ),
      ),
    );
  }
}
 */
