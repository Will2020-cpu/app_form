import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  final String user;
  const AppDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user),
            accountEmail: const Text(''),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/10928/10928949.png',
              ),
            ),

            decoration: const BoxDecoration(color: Colors.deepPurple),
          ),

          const Spacer(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Cerrar sesion'),
            onTap: () {
              context.go('/login');
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
