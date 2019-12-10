import 'dart:async';

import 'package:flutter/material.dart';
import 'flutter_page_indicator.dart';

class PageContainer extends StatefulWidget{

  final PageView child;
  final PageIndicator indicator;
  final StreamController<int> streamController;
  final MainAxisAlignment mainAxisAlignment;
  final double padding;
  final double paddingBottom;

  PageContainer({this.child, this.indicator, this.streamController,
    this.mainAxisAlignment = MainAxisAlignment.center, this.padding = 8, this.paddingBottom = 6});

  @override
  State<StatefulWidget> createState() {
    return _PageState(child, indicator, streamController, mainAxisAlignment, this.padding, this.paddingBottom);
  }

}

class _PageState extends State<PageContainer>{

  final PageView child;
  final PageIndicator indicator;
  final StreamController<int> streamController;
  final MainAxisAlignment mainAxisAlignment;
  final double padding;
  final double paddingBottom;

  _PageState(this.child, this.indicator, this.streamController, this.mainAxisAlignment, this.padding, this.paddingBottom
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotificationListener(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              child: child,
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
            ),
            Positioned(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: mainAxisAlignment,
                children: <Widget>[
                    indicator
                ],),
              left: padding,
              right: padding,
              bottom: paddingBottom,
            ),
          ],
        ),
        onNotification: (ScrollNotification notification){
          if (notification.depth == 0 && notification is ScrollUpdateNotification) {
            PageMetrics metrics = notification.metrics;
            int currentPage = metrics.page.round();
            streamController.sink.add(currentPage);
          }
          return false;
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamController?.close();
  }

}