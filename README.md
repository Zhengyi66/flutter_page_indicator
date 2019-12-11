# pageview_indicator_plugins

flutter pageview指示器。支持自定义指示器样式

# 用法

在`pubspec.yaml`引入：
```dart
dependencies:
  pageview_indicator_plugins: ^0.0.2
```


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

![gif](https://github.com/Zhengyi66/flutter_page_indicator/blob/master/screenshot/page.gif)
