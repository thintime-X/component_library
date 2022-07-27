## Package使用第三方包:
 
flutter_smart_dialog: ^4.0.2

cached_network_image: ^3.2.0

#### 说明
目前package仅暴露出自定义的组件，工具类仅做代码保存，未对外暴露

## 初始化说明
#### ① 程序入口初始化
InitializeConfig.dart 进行统一初始化，建议在main.dart中进行，此处初始化大部分功能
###### 示例
```dart
void main() => realRunApp();

void realRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeConfig.initial();

  runApp(const MyApp());
}
```
#### ② FlutterSmartDialog初始化
库中引入了FlutterSmartDialog插件库，为了方便使用且易读，本库直接暴露该插件初始化文件，直接使用FlutterSmartDialog库的初始化方式即可
###### 示例
```dart
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
      builder: FlutterSmartDialog.init(),
    );
  }
}
```

## 效果
##### 文本确定弹窗： ClDialogUtil.showConfirmDialog
![img.png](img.png)
