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
    ClDialogUtil.showBottomDialog(
      child: Container(),
      theme: const ClBottomDialogTheme(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 20,
            ),
            ClImageTextView(
              url: "https://upload-images.jianshu.io/upload_images/2739107-5392d79543bcf2d4.png?imageMogr2/auto-orient/strip|imageView2/2/w/1058/format/webp",
              title: "文字",
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
