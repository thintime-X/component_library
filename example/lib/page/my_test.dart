import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

/// @author: zx
/// @description: 
class MyTestPage extends StatelessWidget {
  const MyTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppBar(
        title: "健康和",
      ),
    );
  }
}
