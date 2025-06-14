import 'package:flutter/material.dart';
import 'package:homeword/data/shared_preference.dart';
import 'package:homeword/routes/app_routes.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          SharedPreData.logout();
          AppRoutes.key.currentState!.pushReplacementNamed(
            AppRoutes.splashScreen,
          );
        },
        child: Text("Logout"),
      ),
    );
  }
}
