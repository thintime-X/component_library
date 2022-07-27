import 'package:flutter/material.dart';

/// @author: zx
/// @description: 弹窗底部按钮样式主题配置
class ClDialogButtonTheme {
  const ClDialogButtonTheme({
    this.cancelBackground = Colors.white,
    this.confirmBackground = Colors.white,
    this.cancelStyle = const TextStyle(
      color: Colors.black,
      letterSpacing: 2,
    ),
    this.confirmStyle = const TextStyle(
      color: Colors.blue,
      letterSpacing: 2,
    ),
    this.radius = const Radius.circular(10),
    this.showLine = true,
    this.showCancel = true,
  });

  ///返回键背景色
  final Color cancelBackground;

  ///确定键背景色
  final Color confirmBackground;

  ///返回键文字样式
  final TextStyle cancelStyle;

  ///确定键文字样式
  final TextStyle confirmStyle;

  ///圆角角度
  final Radius radius;

  ///是否显示分割线
  final bool showLine;

  ///是否显示返回键
  final bool showCancel;

  ClDialogButtonTheme copyWith({
    Color? cancelBackground,
    Color? confirmBackground,
    TextStyle? cancelStyle,
    TextStyle? confirmStyle,
    Radius? radius,
    bool? showLine,
    bool? showCancel,
  }) {
    return ClDialogButtonTheme(
      cancelBackground: cancelBackground ?? this.cancelBackground,
      confirmBackground: confirmBackground ?? this.confirmBackground,
      cancelStyle: cancelStyle ?? this.cancelStyle,
      confirmStyle: confirmStyle ?? this.confirmStyle,
      radius: radius ?? this.radius,
      showLine: showLine ?? this.showLine,
      showCancel: showCancel ?? this.showCancel,
    );
  }
}
