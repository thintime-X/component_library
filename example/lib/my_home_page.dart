import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

/// @author: zx
/// @description:
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    /*ClDialogUtil.showBottomDialog(
      title: "标题",
      child: Column()
    );*/
    setState(() {
      errorText = "错误信息";
    });
  }

  String? errorText;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClAppBar(
        title: "标题",
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClTextField(
              showBorder: true,
              isPassword: true,
              config: ClTextFieldConfig(
                decoration: InputDecoration(
                  errorText: errorText,
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
