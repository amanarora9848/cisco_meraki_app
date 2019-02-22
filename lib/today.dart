import 'package:flutter/material.dart';

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Text(
          'Today',
          style: new TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
