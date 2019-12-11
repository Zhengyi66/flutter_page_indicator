library flutter_page_indicator;

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  ///PageView 子view集合的长度
  final int length;

  ///PageController
  final PageController pageController;

  ///默认颜色
  final Color defaultColor;

  ///默认宽度
  final double defaultWidth;

  ///默认高度
  final double defaultHeight;

  ///默认Decoration
  final Decoration defaultDecoration;

  ///当前颜色
  final Color currentColor;

  ///当前宽度
  final double currentWidth;

  ///当前高度
  final double currentHeight;

  ///当前Decoration
  final Decoration currentDecoration;

  ///间距
  final double padding;
  PageIndicator({
    Key key,
    this.length,
    this.pageController,
    this.defaultColor = Colors.white,
    this.defaultWidth = 8,
    this.defaultHeight = 8,
    this.defaultDecoration,
    this.currentColor = Colors.grey,
    this.currentWidth = 8,
    this.currentHeight = 8,
    this.currentDecoration,
    this.padding = 8,
  }): assert(length != null), assert(pageController != null), super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<PageIndicator> {
  StreamController _streamController;
  double page = 0;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<double>();
    widget.pageController.addListener((){
      page = widget.pageController.page;
      _streamController.sink.add(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.defaultWidth * widget.length +
          widget.padding * (widget.length + 1),
      height: widget.currentHeight,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, position) {
                  return Container(
                    width: widget.defaultWidth,
                    height: widget.defaultHeight,
                    margin: EdgeInsets.only(
                        left: widget.padding),
                    decoration: widget.defaultDecoration ??
                        BoxDecoration(
                            color: widget.defaultColor, shape: BoxShape.circle),
                  );
                }),
          ),
          Positioned(
            child: StreamBuilder<double>(
                stream: _streamController.stream,
                initialData: 0,
                builder: (context, snapshot) {
                  return Container(
                    width: widget.currentWidth,
                    height: widget.currentHeight,
                    decoration: widget.currentDecoration ?? BoxDecoration(
                        color: widget.currentColor, shape: BoxShape.circle),
                    margin: EdgeInsets.only(
                      left: left(snapshot.data),
                    ),
                  );
                }),
            left: 0,
          )
        ],
      ),
    );
  }


  double left(double page){
    if(widget.currentWidth > widget.defaultWidth){
      return widget.defaultWidth * page + widget.padding*page + widget.padding - (widget.currentWidth - widget.defaultWidth)/2;
    }else{
      return (widget.defaultWidth * page + (page+1) * widget.padding);
    }

  }


  @override
  void dispose() {
    super.dispose();
    _streamController?.close();
  }
}
