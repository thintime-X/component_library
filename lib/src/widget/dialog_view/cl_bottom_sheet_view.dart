import 'package:component_library/src/res/my_gaps.dart';
import 'package:component_library/src/widget/button/cl_bottom_button.dart';
import 'package:flutter/material.dart';

/// @author: zx
/// @description: 底部弹窗基础View
class ClBottomSheetView extends StatelessWidget {
  /// 高度，此属性在使用flutter自带的[showModalBottomSheet]下可能无效
  final double? height;

  /// 标题
  final String? title;

  /// 标题样式
  final TextStyle? titleStyle;

  /// 内容
  final Widget child;

  ///弹窗背景色，默认 白色
  final Color background;

  ///弹窗圆角，此属性在使用flutter自带的[showModalBottomSheet]下可能无效
  final BorderRadius? borderRadius;

  /// 显示底部按钮，默认 false
  final bool showButton;

  /// 显示标题与内容的分割线，默认 false
  final bool showTitleLine;

  /// 组合高度，默认 45
  final double buttonHeight;

  /// 显示按钮之间的分割线，默认false
  final bool showButtonLine;

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
  final BorderRadius mainBorderRadius;

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
  final BorderRadius secondBorderRadius;

  /// 次按钮边框颜色，默认 透明
  final Color secondBorderColor;

  /// 次按钮边框宽度，默认 0
  final double secondBorderWidth;

  /// 次按钮回调
  final Function()? secondTap;

  /// 按钮与屏幕的边距，默认 0
  final EdgeInsetsGeometry buttonMargin;

  const ClBottomSheetView({
    Key? key,
    this.height,
    this.title,
    this.titleStyle,
    required this.child,
    this.background = Colors.white,
    this.borderRadius,
    this.showButton = false,
    this.showTitleLine = false,
    this.buttonHeight = 45,
    this.showButtonLine = false,
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
    this.buttonMargin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      bottomView = Padding(
        padding: buttonMargin,
        child: ClBottomButton(
          height: buttonHeight,
          showLine: showButtonLine,
          spacing: spacing,
          mainText: mainText,
          mainStyle: mainStyle,
          mainBackground: mainBackground,
          mainElevation: mainElevation,
          mainBorderColor: mainBorderColor,
          mainBorderWidth: mainBorderWidth,
          mainBorderRadius: mainBorderRadius,
          mainTap: mainTap,
          secondText: secondText,
          secondStyle: secondStyle,
          secondBackground: secondBackground,
          secondElevation: secondElevation,
          secondBorderColor: secondBorderColor,
          secondBorderWidth: secondBorderWidth,
          secondBorderRadius: secondBorderRadius,
          secondTap: secondTap,
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: height ?? MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: background,
            borderRadius: borderRadius,
          ),
          child: Column(
            children: [
              if (titleView != null) titleView,
              if (showTitleLine) MyGaps.hLine,
              Expanded(
                child: child,
              ),
              if (bottomView != null) bottomView,
            ],
          ),
        ),
      ],
    );
  }
}
