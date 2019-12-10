import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int width = 10;

  ///PageView 子view长度
  final int length;

  ///通知刷新
  final StreamController<int> streamController;

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

  PageIndicator(
      this.length,
      this.streamController, {
        this.defaultColor = Colors.white,
        this.defaultWidth = 8,
        this.defaultHeight = 8,
        this.defaultDecoration,
        this.currentColor = Colors.grey,
        this.currentWidth = 8,
        this.currentHeight = 8,
        this.currentDecoration,
        this.padding = 8,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: defaultWidth * length + padding * (length - 1),
        height: currentHeight,
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
                  itemCount: length,
                  itemBuilder: (_, position) {
                    ///默认圆点
                    return Container(
                      width: defaultWidth,
                      height: defaultHeight,
                      margin: EdgeInsets.only(
                          left: position == 0 ? 0 : padding),
                      decoration: defaultDecoration ??
                          BoxDecoration(
                              color: defaultColor, shape: BoxShape.circle),
                    );
                  }),
            ),
            Positioned(
              child: StreamBuilder<int>(
                  stream: streamController.stream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    print("width: " + currentWidth.toString());
                    ///当前圆点
                    return Container(
                      width: currentWidth,
                      height: currentHeight,
                      decoration: currentDecoration ??
                          BoxDecoration(
                              color: currentColor, shape: BoxShape.circle),
                      margin: EdgeInsets.only(
                        left: currentWidth > defaultWidth ? left(snapshot.data)
                          : (defaultWidth * snapshot.data + snapshot.data * padding),
                      ),
                    );
                  }),
              left: 0,
            )
          ],
        ));
  }

  double left(int position){
    if (position == 0){
      return 0;
    } else if(position == length -1){
      return position * defaultWidth + (position - 1) * padding + (padding - (currentWidth - defaultWidth));
    }else {
      return position * defaultWidth + (position - 1) * padding + (padding - (currentWidth - defaultWidth)/2);
    }
  }
}
