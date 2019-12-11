# flutter_page_indicator

flutter pageview指示器。支持自定义指示器样式

# 用法
基本用法：
```dart
PageIndicator(
    length: 6,
    pageController: pageController,
)
```
可以通过自定义Decoration属性修改圆点形状
```dart
PageIndicator(
    length: 6,
    pageController: secondController,
    currentWidth: 16,
    currentDecoration: BoxDecoration(
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(10)),
)
```

## 效果图

![运行效果](https://github.com/Zhengyi66/flutter_page_indicator/blob/master/screenshot/page.gif)
