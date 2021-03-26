import 'package:flutter/material.dart';
import 'package:flutter_2d_slider/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter 2D Slider Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double posx = 0;
  double posy = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("'flutter 2D Slider Demo'"),
      ),
      body: Slider2D(
        posx: posx,
        posy: posy,
        onChange: (x, y) {
          setState(() {
            posx = x;
            posy = y;
          });
        },
        thumbSize: 20,
      ),
    );
  }
}
