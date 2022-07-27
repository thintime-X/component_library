import 'package:flutter/material.dart';

import 'cl_dialog_button_theme.dart';

/// @author: zx
/// @description: 底部弹窗样式配置
class ClBottomDialogTheme {

  const ClBottomDialogTheme({
    this.background = Colors.white,
    this.titleStyle = const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 2,),
    this.borderRadius = const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    this.buttonTheme = const ClDialogButtonTheme(showLine: false, showCancel: false),
  });

  ///弹窗背景色
  final Color background;
  ///标题文字样式
  final TextStyle titleStyle;
  ///弹窗圆角
  final BorderRadius borderRadius;
  ///底部按钮样式，为空时显示默认
  final ClDialogButtonTheme buttonTheme;

  ClBottomDialogTheme copyWith({
    Color? background,
    TextStyle? titleStyle,
    BorderRadius? borderRadius,
    ClDialogButtonTheme? buttonTheme,
  }) {
    return ClBottomDialogTheme(
      background: background ?? this.background,
      titleStyle: titleStyle ?? this.titleStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      buttonTheme: buttonTheme ?? this.buttonTheme,
    );
  }
}