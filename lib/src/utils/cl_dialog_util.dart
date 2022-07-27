import 'package:component_library/src/config/cl_dialog_config.dart';
import 'package:component_library/src/dialog/cl_dialog_bottom_view.dart';
import 'package:component_library/src/dialog/cl_dialog_center_view.dart';
import 'package:component_library/src/theme/cl_dialog_bottom_theme.dart';
import 'package:component_library/src/theme/cl_dialog_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// @author: zx
/// @description: 弹窗工具
class ClDialogUtil {

  ///自定义弹窗
  static void showDialog({
    required Widget child,
    ClDialogConfig? config,
  }) {
    SmartDialog.show(
      builder: (context) {
        return child;
      },
      controller: config?.controller,
      alignment: config?.alignment,
      clickMaskDismiss: config?.clickMaskDismiss,
      usePenetrate: config?.usePenetrate,
      useAnimation: config?.useAnimation,
      animationType: config?.animationType,
      animationTime: config?.animationTime,
      maskColor: config?.maskColor,
      maskWidget: config?.maskWidget,
      debounce: config?.debounce,
      onDismiss: config?.onDismiss,
      onMask: config?.onMask,
      displayTime: config?.displayTime,
      tag: config?.tag,
      backDismiss: config?.backDismiss,
      keepSingle: config?.keepSingle,
      permanent: config?.permanent,
      useSystem: config?.useSystem,
      bindPage: config?.bindPage,
    );
  }

  ///文本确定弹窗
  static void showConfirmDialog({
    required String title,
    String? content,
    double? buttonHeight,
    String? cancelText,
    String? confirmText,
    Widget? bottomWidget,
    Function()? onCancel,
    Function()? onConfirm,
    ClDialogConfig? config,
    ClDialogTheme? theme,
  }) {
    showDialog(
      config: config,
      child: DialogCenterView(
        title: title,
        child: content != null ? Container(
          alignment: Alignment.center,
          padding: theme?.contentPadding,
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: theme?.contentStyle,
          ),
        ) : const SizedBox(),
        buttonHeight: buttonHeight,
        leftText: cancelText,
        rightText: confirmText,
        bottomWidget: bottomWidget,
        onLeftTap: onCancel ?? () {
          dismissDialog();
        },
        onRightTap: onConfirm ?? () {
          dismissDialog();
        },
        theme: theme ?? const ClDialogTheme(),
      ),
    );
  }

  ///底部弹窗
  static void showBottomDialog({
    double? height,
    String? title,
    bool showTitle = true,
    required Widget child,
    Widget? bottomWidget,
    bool showBottomButton = true,
    double? buttonHeight,
    String? leftText,
    String? rightText,
    Function()? onLeftTap,
    Function()? onRightTap,
    ClDialogConfig? config,
    ClBottomDialogTheme? theme,
  }) {
    showDialog(
      config: config?.copyWith(
        alignment: Alignment.bottomCenter,
      ) ?? ClDialogConfig().copyWith(
        alignment: Alignment.bottomCenter,
      ),
      child: ClDialogBottomView(
        height: height,
        title: title,
        showTitle: showTitle,
        child: child,
        bottomWidget: bottomWidget,
        showBottomButton: showBottomButton,
        buttonHeight: buttonHeight,
        leftText: leftText,
        rightText: rightText,
        onLeftTap: onLeftTap,
        onRightTap: onRightTap,
        theme: theme ?? const ClBottomDialogTheme(),
      ),
    );
  }

  ///关闭弹窗
  static dismissDialog({bool useSystem = false, String? tag}) {
    SmartDialog.dismiss(tag: useSystem ? null : tag);
  }
}
