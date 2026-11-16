import 'package:app_form/components/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String user;
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      drawer: AppDrawer(user: user),
      body: const Center(child: Text('Bienvenido a la aplicacion')),
    );
  }
}
