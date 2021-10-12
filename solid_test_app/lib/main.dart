import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Solid Test App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Solid Test App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text = 'Hey there';
  Color _color = const Color(0x00ffffff);

  void initState() {
    setState(() {
      generateColor();
      super.initState();
    });
  }

  void generateColor() {
    setState(() {
      _color =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  void displayColorCode() {
    setState(() {
      _text =
          'Background Color (RGB): (${_color.red}, ${_color.green}, ${_color.blue})';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const FlutterLogo(),
              onPressed: () {
                generateColor();
                displayColorCode();
              },
            );
          },
        ),
        title: Text(widget.title),
        backgroundColor: _color,
      ),
      body: GestureDetector(
        onTap: () {
          generateColor();
          displayColorCode();
        },
        child: Container(
          color: _color,
          alignment: Alignment.center,
          child: Text(_text),
        ),
      ),
    );
  }
}
