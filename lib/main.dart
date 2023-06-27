import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _result = [];
  final List<String> _images = [
    'images/bar.png',
    'images/cerise.png',
    'images/cloche.png',
    'images/diamant.png',
    'images/fer-a-cheval.png',
    'images/pasteque.png',
    'images/sept.png'
  ];

  void _play() {
    setState(() {
      _result = [
        _images[_random(1, 7)],
        _images[_random(1, 7)],
        _images[_random(1, 7)],
      ];
    });
  }

  bool _win() {
    if(
      _result.isEmpty ||
          (_result[0] != _result[1] || _result[1] != _result[2])
    ) {
      return false;
    }

    return true;
  }

  bool _jackpot() {
    return _result[0] == _result[1] && _result[1]== _result[2] && _result[0] == 'images/sept.png';
  }

  int _random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _win() ?
        Colors.yellow :
        Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
            'Casino',
          style: TextStyle(
            color: Colors.white
          )
        ),
      ),
      body: Center(
        child: _result.isNotEmpty ?
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    _result[0],
                    height: 100,
                    width: 100,
                  ),
                  Image.asset(
                    _result[1],
                    height: 100,
                    width: 100,
                  ),
                  Image.asset(
                    _result[2],
                    height: 100,
                    width: 100,
                  )
                ]
              ),
              Text(
                  _jackpot() ?
                    'Super Jackpot !!!' :
                      _win() ?
                          'Jackpot' :
                          'Yoo loose... Try Again !',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: _win() ?
                          FontWeight.w700 :
                          FontWeight.w300
                  )
              )
            ]
          ) :
          const Text(
              'Welcome to Casino !',
              style: TextStyle(
                fontSize: 30,
              )
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _play,
        tooltip: 'Increment',
        child: const Icon(Icons.restart_alt_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
