import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Toe'),
        ),
        body: Center(
            child: Column(
          children: getBlock(),
        )));
  }

  getBlock() {
    final _a = <Widget>[];
    for (var i = 0; i < 10; i++) {
      _a.add(Text(i.toStringAsFixed(10)));
    }
    return _a;
  }
}
