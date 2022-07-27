import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// @author: zx
/// @description: 弹窗配置文件，具体参数说明请查看 [SmartDialog] 中的show方法
class ClDialogConfig {
  ClDialogConfig({
    this.controller,
    this.alignment,
    this.clickMaskDismiss,
    this.usePenetrate,
    this.useAnimation,
    this.animationType,
    this.animationTime,
    this.maskColor,
    this.maskWidget,
    this.debounce,
    this.onDismiss,
    this.onMask,
    this.displayTime,
    this.tag,
    this.backDismiss,
    this.keepSingle,
    this.permanent,
    this.useSystem = false,
    this.bindPage,
  });

  final SmartDialogController? controller;
  final AlignmentGeometry? alignment; //弹窗的位置
  final bool? clickMaskDismiss; //true（点击遮罩后，将关闭dialog），false（不关闭）
  final bool? usePenetrate;
  final bool? useAnimation;
  final SmartAnimationType? animationType;
  final Duration? animationTime;
  final Color? maskColor;
  final Widget? maskWidget;
  final bool? debounce;
  final VoidCallback? onDismiss; //在dialog被关闭的时候，该回调将会被触发
  final VoidCallback? onMask;
  final Duration? displayTime;
  final String? tag;
  final bool? backDismiss; //点击返回是否关闭 true关闭loading false不会关闭loading
  final bool? keepSingle;
  final bool? permanent;
  final bool? useSystem;
  final bool? bindPage; //将该dialog与当前页面绑定

  ClDialogConfig copyWith({
    SmartDialogController? controller,
    AlignmentGeometry? alignment,
    bool? clickMaskDismiss,
    bool? usePenetrate,
    bool? useAnimation,
    SmartAnimationType? animationType,
    Duration? animationTime,
    Color? maskColor,
    Widget? maskWidget,
    bool? debounce,
    VoidCallback? onDismiss,
    VoidCallback? onMask,
    Duration? displayTime,
    String? tag,
    bool? backDismiss,
    bool? keepSingle,
    bool? permanent,
    bool? useSystem,
    bool? bindPage,
  }) {
    return ClDialogConfig(
      controller: controller ?? this.controller,
      alignment: alignment ?? this.alignment,
      clickMaskDismiss: clickMaskDismiss ?? this.clickMaskDismiss,
      usePenetrate: usePenetrate ?? this.usePenetrate,
      useAnimation: useAnimation ?? this.useAnimation,
      animationType: animationType ?? this.animationType,
      animationTime: animationTime ?? this.animationTime,
      maskColor: maskColor ?? this.maskColor,
      maskWidget: maskWidget ?? this.maskWidget,
      debounce: debounce ?? this.debounce,
      onDismiss: onDismiss ?? this.onDismiss,
      onMask: onMask ?? this.onMask,
      displayTime: displayTime ?? this.displayTime,
      tag: tag ?? this.tag,
      backDismiss: backDismiss ?? this.backDismiss,
      keepSingle: keepSingle ?? this.keepSingle,
      permanent: permanent ?? this.permanent,
      useSystem: useSystem ?? this.useSystem,
      bindPage: bindPage ?? this.bindPage,
    );
  }
}
