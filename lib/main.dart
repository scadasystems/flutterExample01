import 'package:flutter/material.dart';

void main() => runApp(new RotationIconApp());

class RotationIconApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: '아이콘 회전'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
        new Slider(
        value: _position,
            onChanged: (var position) {
              setState(() {
                _position = position;
              });
            }),
        new Transform.rotate(
          angle: _position * 2 * 3.14,
          child: new Icon(Icons.android),
        ),
        new Transform.rotate(
            angle: _position * -2 * 3.14,
            child: new Icon(Icons.android),
      ),
      ],
    ),)
    ,
    );
  }
}
