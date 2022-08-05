import 'package:component_library/component_library.dart';
import 'package:component_library/src/res/my_gaps.dart';
import 'package:flutter/material.dart';

/// @author: zx
/// @description: 底部组合按钮，多用于页面底部或弹窗
class ClBottomButton extends StatelessWidget {
  /// 组合高度，默认 45
  final double height;

  /// 显示按钮之间的分割线，默认false
  final bool showLine;

  /// 按钮之间的间距，默认 8
  final double spacing;

  /// 主按钮文案，默认文案 确定
  final String mainText;

  /// 主按钮文案字体样式
  final TextStyle? mainStyle;

  /// 主按钮背景色，默认 白色
  final Color mainBackground;

  /// 主按钮阴影范围，默认 0
  final double mainElevation;

  /// 主按钮圆角，默认 0
  final BorderRadius? mainBorderRadius;

  /// 主按钮边框颜色，默认 透明
  final Color mainBorderColor;

  /// 主按钮边框宽度，默认 0
  final double mainBorderWidth;

  /// 主按钮回调
  final Function()? mainTap;

  /// 次按钮文案，默认为空，不显示
  final String? secondText;

  /// 次按钮文案字体样式
  final TextStyle? secondStyle;

  /// 次按钮背景色，默认 白色
  final Color secondBackground;

  /// 次按钮阴影范围，默认 0
  final double secondElevation;

  /// 次按钮圆角，默认 0
  final BorderRadius? secondBorderRadius;

  /// 次按钮边框颜色，默认 透明
  final Color secondBorderColor;

  /// 次按钮边框宽度，默认 0
  final double secondBorderWidth;

  /// 次按钮回调
  final Function()? secondTap;

  const ClBottomButton({
    Key? key,
    this.height = 45,
    this.showLine = false,
    this.spacing = 8,
    this.mainText = "确定",
    this.mainStyle,
    this.mainBackground = Colors.white,
    this.mainElevation = 0,
    this.mainBorderRadius = BorderRadius.zero,
    this.mainBorderColor = Colors.transparent,
    this.mainBorderWidth = 0,
    this.mainTap,
    this.secondText,
    this.secondStyle,
    this.secondBackground = Colors.white,
    this.secondElevation = 0,
    this.secondBorderRadius = BorderRadius.zero,
    this.secondBorderColor = Colors.transparent,
    this.secondBorderWidth = 0,
    this.secondTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 默认字体样式
    TextStyle mainDefaultStyle = TextStyle(fontSize: 14, color: (mainBackground.computeLuminance() < .5) ? Colors.white : Colors.black);
    TextStyle secondDefaultStyle = TextStyle(fontSize: 14, color: (secondBackground.computeLuminance() < .5) ? Colors.white : Colors.black);


    /// 主按钮
    Widget mainButton = Expanded(
      child: ClElevatedButton(
        height: height,
        text: mainText,
        textStyle: mainStyle ?? mainDefaultStyle,
        background: mainBackground,
        elevation: mainElevation,
        borderRadius: mainBorderRadius,
        borderColor: mainBorderColor,
        borderWidth: mainBorderWidth,
        onTap: mainTap,
      ),
    );

    /// 次按钮
    Widget? secondButton;
    if (secondText != null) {
      secondButton = Expanded(
        child: ClElevatedButton(
          height: height,
          text: secondText,
          textStyle: secondStyle ?? secondDefaultStyle,
          background: secondBackground,
          elevation: secondElevation,
          borderRadius: secondBorderRadius,
          borderColor: secondBorderColor,
          borderWidth: secondBorderWidth,
          onTap: secondTap,
        ),
      );
    }

    return SizedBox(
      height: height,
      child: Row(
        children: [
          if (secondButton != null) secondButton,
          if (secondButton != null && showLine) MyGaps.vLine,
          if (secondButton != null && !showLine) SizedBox(width: spacing,),
          mainButton,
        ],
      ),
    );
  }
}
