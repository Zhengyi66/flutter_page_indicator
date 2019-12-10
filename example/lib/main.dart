import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/page_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamController<int> streamController;
  StreamController<int> secondStreamController;

  @override
  void initState() {
    super.initState();
    streamController = StreamController<int>();
    secondStreamController = StreamController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterPageIndicator example app'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                child: PageContainer(
                  child: PageView(
                    children: <Widget>[
                      Container(
                        color: Colors.amber[100],
                      ),
                      Container(
                        color: Colors.amber[200],
                      ),
                      Container(
                        color: Colors.amber[300],
                      ),
                      Container(
                        color: Colors.amber[400],
                      ),
                      Container(
                        color: Colors.amber[500],
                      ),
                      Container(
                        color: Colors.amber[600],
                      ),
                    ],
                  ),
                  indicator: PageIndicator(6, streamController,),
                  streamController: streamController,
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 30)),

              Container(
                height: 150,
                child: PageContainer(
                  child: PageView(
                    children: <Widget>[
                      Container(
                        color: Colors.amber[100],
                      ),
                      Container(
                        color: Colors.amber[200],
                      ),
                      Container(
                        color: Colors.amber[300],
                      ),
                      Container(
                        color: Colors.amber[400],
                      ),
                      Container(
                        color: Colors.amber[500],
                      ),
                      Container(
                        color: Colors.amber[600],
                      ),
                    ],
                  ),
                  indicator: PageIndicator(6, secondStreamController,
                    defaultWidth: 10,
                    padding: 10,
                    defaultDecoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),),//borderRadius: BorderRadius.circular(20),
                    currentWidth: 16,
                    currentDecoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [Colors.lightGreenAccent, Colors.cyan])),
                  ),
                  streamController: secondStreamController,
                  mainAxisAlignment: MainAxisAlignment.start,
                  padding: 10,
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamController?.close();
    secondStreamController?.close();
  }
}
