import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// @author: zx
/// @description: 土司工具及加载弹窗工具
class ClToast {
  static const String loadingTag = "loadingTag";

  ///toast
  static void showMsg(String msg,{Alignment alignment = Alignment.bottomCenter}) {
    SmartDialog.showToast(msg,alignment: alignment);
  }

  ///加载弹窗
  static void showLoading(
      {String msg = "加载中",
      bool clickMaskDismiss = true,
      bool backDismiss = true,
      String? tag}) {
    SmartDialog.showLoading(
      msg: msg,
      clickMaskDismiss: clickMaskDismiss,
      backDismiss: backDismiss,
    );
  }

  static void dismiss() {
    SmartDialog.dismiss();
  }
}
