import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //final wordPair = new WordPair.random();
//     return new MaterialApp(
//       title: 'Welcome to Flutter',
//       theme: new ThemeData(primaryColor: Colors.redAccent),
//       home: new RandomWords(),
//     );
//   }
// }

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordState();
  }
}

class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  Widget _buildRow(WordPair suggestion) {
    final alreadySaved = _saved.contains(suggestion);
    return new ListTile(
      title: new Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(suggestion);
          } else {
            _saved.add(suggestion);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('startup Name Generator'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final titles = _saved.map((pair) {
        return new ListTile(
          title: new Text(pair.asPascalCase, style: _biggerFont),
        );
      });
      final divided =
          ListTile.divideTiles(context: context, tiles: titles).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }
}
