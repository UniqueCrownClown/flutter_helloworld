import 'package:flutter/material.dart';
import 'package:flutter_helloworld/thirdRoute.dart';
import 'package:flutter_helloworld/views/CounterModel.dart';
import 'package:provider/provider.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body: Column(
        children: <Widget>[
          Text("SecondRoute"),
          Text(
            'Value: ${_counter.value}',
            style: TextStyle(fontSize: textSize),
          ),
          RaisedButton(
            onPressed: () {
              //路由pop弹出
              Navigator.pop(context);
            },
            child: Text("返回"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ThirdRoute())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
