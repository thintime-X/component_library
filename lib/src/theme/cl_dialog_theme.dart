import 'package:component_library/src/theme/cl_dialog_button_theme.dart';
import 'package:flutter/material.dart';

/// @author: zx
/// @description: 弹窗主题配置文件
class ClDialogTheme {

  const ClDialogTheme({
    this.background = Colors.white,
    this.titleStyle = const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 2,),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.showLine = true,
    this.buttonTheme = const ClDialogButtonTheme(),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15,),
    this.contentStyle = const TextStyle(color: Color(0xFF696969), fontSize: 14,),
  });

  ///弹窗背景色
  final Color background;
  ///标题文字样式
  final TextStyle titleStyle;
  ///弹窗圆角
  final BorderRadius borderRadius;
  ///是否显示分割线
  final bool showLine;
  ///底部按钮样式，为空时显示默认
  final ClDialogButtonTheme buttonTheme;

  //-------------以下字段为确定弹窗 showConfirmDialog 所有----------------
  ///内容区padding
  final EdgeInsetsGeometry? contentPadding;
  ///内容文字样式
  final TextStyle contentStyle;

  ClDialogTheme copyWith({
    Color? background,
    TextStyle? titleStyle,
    BorderRadius? borderRadius,
    bool? showLine,
    ClDialogButtonTheme? buttonTheme,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentStyle,
  }) {
    return ClDialogTheme(
      background: background ?? this.background,
      titleStyle: titleStyle ?? this.titleStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      showLine: showLine ?? this.showLine,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      contentPadding: contentPadding ?? this.contentPadding,
      contentStyle: contentStyle ?? this.contentStyle,
    );
  }
}
