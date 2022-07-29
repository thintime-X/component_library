import 'package:flutter/material.dart';

/// @author: zx
/// @description: 通用占位盒子封装和分割线
class MyGaps {
  static Widget hLine = const SizedBox(
    height: 0.5,
    width: double.infinity,
    child: DecoratedBox(decoration: BoxDecoration(color: Color(0xFFECECEC))),
  );

  static Widget vLine = const SizedBox(
    width: 0.5,
    height: double.infinity,
    child: DecoratedBox(decoration: BoxDecoration(color: Color(0xFFECECEC))),
  );
}