import 'package:component_library/src/theme/cl_dialog_theme.dart';
import 'package:flutter/material.dart';

import 'cl_dialog_button.dart';

/// @author: zx
/// @description: 中间弹窗基础View
class DialogCenterView extends StatelessWidget {
  /// 标题
  final String title;
  /// 内容
  final Widget child;
  ///底部按钮高度，bottomWidget不为空时无效
  final double? buttonHeight;
  ///左边按钮文本
  final String? leftText;
  ///右边按钮文本
  final String? rightText;
  ///弹窗样式
  final ClDialogTheme theme;
  ///底部组件，不为空时，与按钮互为排斥
  final Widget? bottomWidget;
  ///左边按钮回调，bottomWidget不为空时无效
  final Function()? onLeftTap;
  ///右边按钮回调，bottomWidget不为空时无效
  final Function()? onRightTap;

  const DialogCenterView({
    Key? key,
    required this.title,
    required this.child,
    this.buttonHeight,
    this.leftText,
    this.rightText,
    this.theme = const ClDialogTheme(),
    this.bottomWidget,
    this.onLeftTap,
    this.onRightTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: theme.background,
            borderRadius: theme.borderRadius,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: theme.titleStyle,
                ),
              ),
              child,
              if (theme.showLine) Container(
                height: 1,
                color: const Color(0xFFECECEC),
              ),
              _getBottomWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getBottomWidget() {
    if (bottomWidget != null) {
      return bottomWidget!;
    } else {
      return ClDialogButton(
        height: buttonHeight,
        leftText: leftText,
        rightText: rightText,
        theme: theme.buttonTheme,
        onLeftTap: onLeftTap,
        onRightTap: onRightTap,
      );
    }
  }
}
