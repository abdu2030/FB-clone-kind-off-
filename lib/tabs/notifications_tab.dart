import 'package:flutter/material.dart';
import '../widgets/empty_page.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyPage(title: 'Notifications', icon: Icons.notifications);
  }
}
