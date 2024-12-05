import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/bindings/app_bindings.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.list,
      getPages: AppRoutes.routes,
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
