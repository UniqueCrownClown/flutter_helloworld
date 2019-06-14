import 'package:flutter/material.dart';

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('thirdRouter'),
      ),
      body: Column(
        children: <Widget>[Text('页面3')],
      ),
    );
  }
}
