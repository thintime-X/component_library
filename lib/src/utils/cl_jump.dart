import 'package:flutter/material.dart';

/// @author: zx
/// @description: 原始跳转封装，仅保存代码，暂时未暴露
jumpPage(BuildContext context, routeName, {dynamic arguments, bool needLogin = true, Function? callback}) {
  var jumpArguments = {
    'arguments': arguments,
    'needLogin': needLogin,
  };
  if (null == callback) {
    Navigator.of(context).pushNamed(routeName, arguments: jumpArguments);
  } else {
    Navigator.of(context).pushNamed(routeName, arguments: jumpArguments).then((value) {
      callback(value);
    });
  }
}

closePage(BuildContext context) {
  Navigator.pop(context);
}

returnPage(BuildContext context,{dynamic data}) {
  Navigator.pop(context, data);
}

closeAllAndJumpPage(BuildContext context, String routeName) {
  Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
}

void replacePage(BuildContext context, String routeName,{dynamic data}) {
  Navigator.pushReplacementNamed(context, routeName, arguments: data);
}