import 'package:component_library/src/res/my_gaps.dart';
import 'package:component_library/src/theme/cl_dialog_button_theme.dart';
import 'package:flutter/material.dart';

import '../button/cl_custom_button.dart';

/// @author: zx
/// @description: 弹窗底部按钮
class ClDialogButton extends StatelessWidget {
  final double? height;
  final String? leftText;
  final String? rightText;
  final ClDialogButtonTheme theme;
  final Function()? onLeftTap;
  final Function()? onRightTap;

  const ClDialogButton({
    Key? key,
    this.height,
    this.leftText,
    this.rightText,
    this.theme = const ClDialogButtonTheme(),
    this.onLeftTap,
    this.onRightTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      child: Row(
        children: [
          if (theme.showCancel) _leftButton(context),
          if (theme.showLine) MyGaps.vLine,
          _rightButton(context),
        ],
      ),
    );
  }

  Widget _leftButton(BuildContext context) {
    return Expanded(
      child: ClElevatedButton(
        height: height ?? 45,
        text: leftText ?? "返回",
        textStyle: theme.cancelStyle,
        background: theme.cancelBackground,
        borderRadius: BorderRadius.only(bottomLeft: theme.radius),
        onTap: onLeftTap,
      ),
    );
  }

  Widget _rightButton(BuildContext context) {
    return Expanded(
      child: ClElevatedButton(
        height: height ?? 45,
        text: leftText ?? "确定",
        textStyle: theme.confirmStyle,
        background: theme.confirmBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: theme.showCancel ? Radius.zero : theme.radius,
          bottomRight: theme.radius,
        ),
        onTap: onRightTap,
      ),
    );
  }
}