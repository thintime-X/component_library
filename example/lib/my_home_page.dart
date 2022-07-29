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
      title: "标题",
      child: Column()
    );
    //Navigator.push(context, MaterialPageRoute(builder: (_) => MyTestPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClAppBar(
        title: "标题",
      ),
      body: Container(
        //padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ClExpansionTile(
              titleText: "标题",
              visualDensity: VisualDensity(vertical: -1),
              textStyle: TextStyle(fontSize: 16),
              tileColor: Colors.grey,
              dense: true,
              trailing: SizedBox(),
              children: [
                ClListTile(
                  titleText: "第一",
                  dense: true,
                  visualDensity: VisualDensity(vertical: -4),
                ),
                ClListTile(
                  titleText: "第一",
                  dense: true,
                  visualDensity: VisualDensity(vertical: -4),
                ),
                ClListTile(
                  titleText: "第一",
                  dense: true,
                  visualDensity: VisualDensity(vertical: -4),
                ),
              ],
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
