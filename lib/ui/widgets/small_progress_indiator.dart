import 'package:flutter/material.dart';

class SmallProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 32,
        width: 32,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
