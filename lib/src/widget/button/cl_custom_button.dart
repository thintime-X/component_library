import 'package:flutter/material.dart';

/// @author: zx
/// @description: 自定义ElevatedButton
class ClElevatedButton extends StatelessWidget {
  /// 按钮宽度
  final double? width;

  /// 按钮高度
  final double? height;

  /// 按钮文案
  final String? text;

  /// 文案样式
  final TextStyle? textStyle;

  /// 背景色，默认 主题色
  final Color? background;

  /// 阴影范围，默认 0
  final double? elevation;

  /// 圆角，默认 5
  final BorderRadius? borderRadius;

  /// 边框颜色，默认 主题色
  final Color? borderColor;

  /// 边框宽度，默认 0，为0时不显示边框
  final double borderWidth;

  /// 点击的回调
  final Function()? onTap;

  const ClElevatedButton({
    Key? key,
    this.width,
    this.height,
    this.text,
    this.textStyle,
    this.background,
    this.elevation = 0,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 背景色
    Color background = this.background ?? Theme.of(context).primaryColor;
    // 边框颜色
    Color borderColor = this.borderColor ?? background;
    // 默认文字样式
    TextStyle defaultStyle = TextStyle(fontSize: 11, color: background.computeLuminance() < .5 ? Colors.white : Colors.black);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(background),
          elevation: MaterialStateProperty.all(elevation),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(5))),
          side: borderWidth == 0 ? null : MaterialStateProperty.all(
            BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text ?? "按钮",
          style: textStyle ?? defaultStyle,
        ),
      ),
    );
  }
}
