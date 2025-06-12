import 'package:flutter/material.dart';
import 'package:homeword/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beltei Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),

      initialRoute: AppRoutes.splashScreen,
      navigatorKey: AppRoutes.key,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
