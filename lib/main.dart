import 'dart:io';

import 'package:code_nes_lab_task/view/widgets/global_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/bindings/app_bindings.dart';
import 'core/routes/app_routes.dart';
// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

void main() {
  // Set the custom global error handler
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };

  // Set custom global error widget
  ErrorWidget.builder =
      (FlutterErrorDetails details) => GlobalError(details: details);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      initialRoute: AppRoutes.list,
      getPages: AppRoutes.routes,
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
