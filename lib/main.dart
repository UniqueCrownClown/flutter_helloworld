import 'package:flutter/material.dart';
import 'package:flutter_helloworld/layoutTest.dart';
import 'package:flutter_helloworld/listView.dart';
import 'package:flutter_helloworld/test.dart';
import 'package:flutter_helloworld/toe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      // home: MainRoute(),
      //注册路由表
      initialRoute: 'toe_page',
      routes: {
        "/": (context) => MainRoute(),
        "second_page": (context) => SecondRoute(),
        "layout_page": (context) => LayoutTest(),
        "toe_page": (context) =>Toe()
      },
    );
  }
}

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      body: Column(
        children: <Widget>[
          Text("第一个页面"),
          RaisedButton(
            onPressed: () async {
              //导航到新路由
              var result = await Navigator.pushNamed(context, "second_page",
                  arguments: "hi,second!");
              debugPrint("返回:$result");
            },
            child: Text("进入第二页"),
          ),
          RaisedButton(
            onPressed: () {
              //导航到新路由
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RandomWords();
              }));
            },
            child: Text("进入listView"),
          ),
          RaisedButton(
            onPressed: () async {
              // 导航到新路由
              // Material库中提供了MaterialPageRoute，它在Android上会上下滑动切换。如果想自定义路由切换动画，可以使用PageRouteBuilder
              var result = await Navigator.push(
                context,
                PageRouteBuilder(
                  ///动画时间
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    ///平移
                    return SlideTransition(
                      ///Tween:在补间动画中，定义开始点结束点
                      position: new Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(animation),
                      child: LayoutTest(),
                    );
                  },
                ),
              );
              debugPrint("返回:$result");
            },
            child: Text("LayoutTest"),
          )
        ],
      ),
    );
  }
}
