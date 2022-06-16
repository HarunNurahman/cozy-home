import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kosan_apps/pages/splash_screen.dart';

// void main() => runApp(
//       DevicePreview(
//         builder: (context) => MyApp(),
//         enabled: !kReleaseMode,
//       ),
//     );

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      home: const SplashScreen(),
    );
  }
}
