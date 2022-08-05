import 'package:component_library/component_library.dart';
import 'package:component_library/src/res/my_gaps.dart';
import 'package:flutter/material.dart';

/// @author: zx
/// @description: 弹窗基础View
class ClDialogView extends StatelessWidget {
  /// 标题
  final String? title;

  /// 标题样式
  final TextStyle? titleStyle;

  /// 内容
  final Widget child;

  ///弹窗背景色，默认 白色
  final Color background;

  ///弹窗圆角，默认 10
  final BorderRadius borderRadius;

  /// 显示底部按钮，默认 false
  final bool showButton;

  /// 显示内容与底部按钮的分割线，默认 false
  final bool showBottomLine;

  /// 组合高度，默认 45
  final double buttonHeight;

  /// 显示按钮之间的分割线，默认false
  final bool? showButtonLine;

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

  const ClDialogView({
    Key? key,
    this.title,
    this.titleStyle,
    required this.child,
    this.background = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.showButton = false,
    this.showBottomLine = false,
    this.buttonHeight = 45,
    this.showButtonLine,
    this.spacing = 8,
    this.mainText = "确定",
    this.mainStyle,
    this.mainBackground = Colors.white,
    this.mainElevation = 0,
    this.mainBorderRadius,
    this.mainBorderColor = Colors.transparent,
    this.mainBorderWidth = 0,
    this.mainTap,
    this.secondText,
    this.secondStyle,
    this.secondBackground = Colors.white,
    this.secondElevation = 0,
    this.secondBorderRadius,
    this.secondBorderColor = Colors.transparent,
    this.secondBorderWidth = 0,
    this.secondTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 主按钮圆角
    BorderRadius? mainRadius = mainBorderRadius;
    if (showButton && mainRadius == null) {
      if (secondText != null) {
        mainRadius = BorderRadius.only(bottomRight: borderRadius.bottomRight);
      } else {
        mainRadius = BorderRadius.only(bottomLeft: borderRadius.bottomLeft, bottomRight: borderRadius.bottomRight);
      }
    }
    /// 次按钮圆角
    BorderRadius? secondRadius = secondBorderRadius;
    if (secondText != null && secondRadius == null) {
      secondRadius = BorderRadius.only(bottomLeft: borderRadius.bottomLeft);
    }
    /// 显示按钮间分割线
    bool showBTLine = showButtonLine ?? secondText != null ? true : false;

    /// 标题
    Widget? titleView;
    if (title != null) {
      titleView = Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          title!,
          style: titleStyle ?? const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    /// 底部组件
    Widget? bottomView;
    if (showButton) {
      bottomView = ClBottomButton(
        height: buttonHeight,
        showLine: showBTLine,
        spacing: spacing,
        mainText: mainText,
        mainStyle: mainStyle,
        mainBackground: mainBackground,
        mainElevation: mainElevation,
        mainBorderColor: mainBorderColor,
        mainBorderWidth: mainBorderWidth,
        mainBorderRadius: mainRadius,
        mainTap: mainTap,
        secondText: secondText,
        secondStyle: secondStyle,
        secondBackground: secondBackground,
        secondElevation: secondElevation,
        secondBorderColor: secondBorderColor,
        secondBorderWidth: secondBorderWidth,
        secondBorderRadius: secondRadius,
        secondTap: secondTap,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: background,
            borderRadius: borderRadius,
          ),
          child: Column(
            children: [
              if (titleView != null) titleView,
              child,
              if (showBottomLine) MyGaps.hLine,
              if (bottomView != null) bottomView,
            ],
          ),
        ),
      ],
    );
  }
}
