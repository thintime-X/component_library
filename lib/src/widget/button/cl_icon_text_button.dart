import 'package:flutter/material.dart';

enum Direction {
  /// 文字在左边
  left,

  /// 文字在右边
  right,

  /// 文字在上边
  top,

  /// 文字在下边
  bottom,
}

/// @author: zx
/// @description: 图文按钮
class ClIconTextButton extends StatelessWidget {
  /// icon的文案
  final String text;

  /// 需要传的icon
  final Widget? iconWidget;

  /// 图文组合的宽度，默认 60
  final double width;

  /// 图文组合的高度，默认60
  final double height;

  /// 图片宽度，默认 20
  final double iconWidth;

  /// 图片高度，默认 20
  final double iconHeight;

  /// 图片与文案的间距，默认 5
  final double spacing;

  /// 点击的回调
  final VoidCallback? onTap;

  /// 文字相对于图片的位置
  final Direction direction;

  ///  文字样式
  final TextStyle? style;

  /// 按钮背景颜色，默认 主题色
  final Color? background;

  /// 阴影范围，默认 0
  final double elevation;

  /// 按钮圆角，默认 5
  final BorderRadius? borderRadius;

  /// 边框颜色，默认 主题色
  final Color? borderColor;

  /// 边框宽度，默认 0，为0时不显示边框
  final double borderWidth;

  const ClIconTextButton({
    Key? key,
    required this.text,
    this.iconWidget,
    this.width = 60,
    this.height = 60,
    this.iconWidth = 20,
    this.iconHeight = 20,
    this.spacing = 5,
    this.onTap,
    this.direction = Direction.top,
    this.style,
    this.background,
    this.elevation = 0,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 0,
  }) : super(key: key);

  Widget getText(TextStyle textStyle) {
    return Text(
      text,
      style: style ?? textStyle,
    );
  }

  Widget getIcon() {
    return SizedBox(
      width: iconWidth,
      height: iconHeight,
      child: iconWidget,
    );
  }

  Widget getButtonBase(Color background, Color borderColor, Widget child) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(background),
          elevation: MaterialStateProperty.all(elevation),
          side: borderWidth == 0 ? null : MaterialStateProperty.all(
            BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(5))),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    // 背景色
    Color background = this.background ?? Theme.of(context).primaryColor;
    // 边框颜色
    Color borderColor = this.borderColor ?? background;
    // 默认文字样式
    TextStyle defaultStyle = TextStyle(fontSize: 11, color: background.computeLuminance() < .5 ? Colors.white : Colors.black);

    if (direction == Direction.top) {
      child = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getIcon(),
          SizedBox(height: spacing,),
          getText(defaultStyle),
        ],
      );
    } else if (direction == Direction.bottom) {
      child = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getText(defaultStyle),
          SizedBox(height: spacing,),
          getIcon(),
        ],
      );
    } else if (direction == Direction.right) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getText(defaultStyle),
          SizedBox(width: spacing,),
          getIcon(),
        ],
      );
    } else {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getIcon(),
          SizedBox(width: spacing,),
          getText(defaultStyle),
        ],
      );
    }

    return getButtonBase(background, borderColor, child);
  }
}
