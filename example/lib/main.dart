import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() => realRunApp();

void realRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeConfig.initial();

  runApp(const MyApp());
}