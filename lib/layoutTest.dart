import 'package:flutter/material.dart';

class LayoutTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    return Scaffold(
        appBar: AppBar(
          title: Text('Layout'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, //类似flexable
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              isVisible ? Icon(Icons.star, size: 50) : const SizedBox(),
              Icon(Icons.star, size: 50),
              ConstrainedBox(
                constraints: BoxConstraints.expand(height: 200),
                child: const Card(
                  child: const Text('Hello World!'),
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: const [
                        Colors.red,
                        Colors.blue,
                      ],
                    ),
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                        'https://flutter.io/images/catalog-widget-placeholder.png',
                      ),
                    ),
                  ),
                  child: Text('蓝色的block'),
                ),
                flex: 1,
              ),
            ],
          ),
        ));
  }
}
