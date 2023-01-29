import 'package:flutter/material.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:login_page/pages/menu.dart';
import 'package:login_page/services/auth_service.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const LoginPage();
    } else {
      return Menu();
    }
  }

  loading() {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
