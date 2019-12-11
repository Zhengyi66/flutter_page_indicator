library flutter_page_indicator;

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  ///PageView 子view集合的长度
  final int length;

  ///PageController
  final PageController pageController;

  ///普通颜色
  final Color normalColor;

  ///普通宽度
  final double normalWidth;

  ///普通高度
  final double normalHeight;

  ///普通Decoration
  final Decoration normalDecoration;

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
    this.normalColor = Colors.white,
    this.normalWidth = 8,
    this.normalHeight = 8,
    this.normalDecoration,
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

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<double>();
    widget.pageController.addListener((){
        _streamController.sink.add(widget.pageController.page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.normalWidth * widget.length +
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
            ///普通圆点用ListView显示
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, position) {
                  return Container(
                    width: widget.normalWidth,
                    height: widget.normalHeight,
                    margin: EdgeInsets.only(
                        left: widget.padding),
                    decoration: widget.normalDecoration ??
                        BoxDecoration(
                            color: widget.normalColor, shape: BoxShape.circle),
                  );
                }),
          ),
          Positioned(
            ///StreamBuilder刷新
            child: StreamBuilder<double>(
                stream: _streamController.stream,
                initialData: 0,
                builder: (context, snapshot) {
                  ///表示当前进度的圆点
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
    if(widget.currentWidth > widget.normalWidth){
      return widget.normalWidth * page + widget.padding*page + widget.padding - (widget.currentWidth - widget.normalWidth)/2;
    }else{
      return (widget.normalWidth * page + (page+1) * widget.padding);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _streamController?.close();
  }
}
