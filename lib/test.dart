import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数  
    var args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body: Column(
        children: <Widget>[
          Text("第一个页面"),
          RaisedButton(
            onPressed: () {
              //路由pop弹出
              Navigator.pop(context);
            },
            child: Text("返回"),
          )
        ],
      ),
    );
  }
}
