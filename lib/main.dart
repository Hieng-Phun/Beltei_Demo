import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:homeword/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(builder: (context) => App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HW',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),

      initialRoute: AppRoutes.splashScreen,
      navigatorKey: AppRoutes.key,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
