import 'package:flutter/material.dart';
import 'package:lab1/auth/logout.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Menu',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 16),

       
        _menuCard(icon: Icons.person, title: 'Profile', onTap: () {}),

        _menuCard(icon: Icons.settings, title: 'Settings', onTap: () {}),

        _menuCard(
          icon: Icons.help_outline,
          title: 'Help & Support',
          onTap: () {},
        ),

        const SizedBox(height: 24),

       
        ElevatedButton.icon(
          onPressed: () => logout(context),
          icon: const Icon(Icons.logout, color: Colors.white),
          label: const Text('Log out', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _menuCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
