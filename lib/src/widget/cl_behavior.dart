import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @author: zx
/// @description: 取消 Android / Fuchsia 回弹效果
class ClBehavior extends StatelessWidget {
  const ClBehavior({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(behavior: MyBehavior(), child: child);
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(context, child, details) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildOverscrollIndicator(context, child, details);
    }
  }
}

class CustomScrollbar extends StatelessWidget {
  const CustomScrollbar({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return Scrollbar(child: child);
    } else {
      return CupertinoScrollbar(child: child);
    }
  }
}
