import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController pageController;
  PageController secondController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    secondController = PageController();
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
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: PageView(
                        controller: pageController,
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
                    ),
                    Positioned(
                      child: Center(
                        child: PageIndicator(
                          length: 6,
                          pageController: pageController,
                        ),
                      ),
                      bottom: 10,
                      left: 0,
                      right: 0,
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                height: 150,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: PageView(
                        controller: secondController,
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
                    ),
                    Positioned(
                      child: Center(
                        child: PageIndicator(
                          length: 6,
                          pageController: secondController,
                          currentWidth: 16,
                          currentDecoration: BoxDecoration(
                              color: Colors.cyanAccent,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      left: 0,
                      right: 0,
                      bottom: 10,
                    )
                  ],
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
    pageController?.dispose();
  }
}
