import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Hero Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // picsum 에서 key 에 따라 특정 이미지를 가져옵니다.
  String imageUrlByKey(int key) {
    return "https://picsum.photos/300/300?image=${key + 200}";
  }

  @override
  Widget build(BuildContext context) {
    final gridBuilder = GridView.builder(
        itemCount: 100,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int position) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                    return ImageDetailHome(imageUrlByKey(position));
                  }));
            },
            child: Hero(
              tag: imageUrlByKey(position),
              child: Image.network(imageUrlByKey(position)),
            ),
          );
        });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: gridBuilder),
    );
  }
}

class ImageDetailHome extends StatelessWidget {
  final String imageUrl;

  ImageDetailHome(this.imageUrl); // 생성자를 통해 imageUrl 을 전달받음

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(tag: imageUrl, child: Image.network(imageUrl)),
      ),
    );
  }
}