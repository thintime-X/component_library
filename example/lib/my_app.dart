import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart';

/// @author: zx
/// @description:
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      navigatorObservers: [
        FlutterSmartDialog.observer,
      ],
      builder: FlutterSmartDialog.init(
        builder: (context, child) {
          return MediaQuery(
            //设置文字大小不随系统设置改变
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Scaffold(
              body: TextSelectionTheme(
                data: TextSelectionThemeData(
                  cursorColor: Theme.of(context).primaryColor,//输入框光标颜色
                ),
                child: GestureDetector(
                  onTap: () {
                    //点击空白收起键盘
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus &&
                        currentFocus.focusedChild != null) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
