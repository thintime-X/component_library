import 'package:component_library/src/res/my_gaps.dart';
import 'package:component_library/src/theme/cl_dialog_bottom_theme.dart';
import 'package:flutter/material.dart';

import 'cl_dialog_button.dart';

/// @author: zx
/// @description: 底部弹窗基础View
class ClDialogBottomView extends StatelessWidget {
  final double? height;
  final String? title;
  final bool showTitle;
  final Widget child;
  ///底部组件，不为空时不显示底部按钮
  final Widget? bottomWidget;
  ///是否显示底部按钮，仅在bottomWidget为空时有效
  final bool showBottomButton;
  final double? buttonHeight;
  ///左边按钮文本
  final String? leftText;
  ///右边按钮文本
  final String? rightText;
  ///左边按钮回调，bottomWidget不为空时无效
  final Function()? onLeftTap;
  ///右边按钮回调，bottomWidget不为空时无效
  final Function()? onRightTap;
  final ClBottomDialogTheme theme;

  const ClDialogBottomView({
    Key? key,
    this.height,
    this.title,
    this.showTitle = true,
    required this.child,
    this.bottomWidget,
    this.showBottomButton = true,
    this.buttonHeight,
    this.leftText,
    this.rightText,
    this.onLeftTap,
    this.onRightTap,
    this.theme = const ClBottomDialogTheme(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height ?? MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: theme.borderRadius,
        color: theme.background,
      ),
      child: Column(
        children: [
          if (showTitle) Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            child: Text(
              title ?? "标题",
              style: theme.titleStyle,
            ),
          ),
          if (showTitle) MyGaps.hLine,
          Expanded(
            child: child,
          ),
          _getBottomWidget(),
        ],
      ),
    );
  }

  Widget _getBottomWidget() {
    if (bottomWidget != null) {
      return bottomWidget!;
    } else if (showBottomButton) {
      return ClDialogButton(
        height: buttonHeight,
        leftText: leftText,
        rightText: rightText,
        theme: theme.buttonTheme,
        onLeftTap: onLeftTap,
        onRightTap: onRightTap,
      );
    } else {
      return const SizedBox();
    }
  }
}
