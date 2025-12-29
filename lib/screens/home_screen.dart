import 'package:flutter/material.dart';
import 'package:lab1/tabs/videos_tab.dart';
import 'package:lab1/tabs/friends_tab.dart';
import '../tabs/home_tab.dart';
import '../tabs/marketplace_tab.dart';
import '../tabs/notifications_tab.dart';
import '../tabs/menu_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F2F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: Color(0xFF1877F2),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            _circleIcon(Icons.add),
            _circleIcon(Icons.search),
            _circleIcon(Icons.message, badge: '9+'),
            const SizedBox(width: 8),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFF1877F2),
            indicatorWeight: 3,
            labelColor: Color(0xFF1877F2),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.home_filled, size: 28)),
              Tab(icon: Icon(Icons.people_alt_outlined, size: 28)),
              Tab(icon: Icon(Icons.ondemand_video_outlined, size: 28)),
              Tab(icon: Icon(Icons.storefront_outlined, size: 28)),
              _NotificationTab(),
              Tab(icon: Icon(Icons.menu, size: 28)),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            FeedTab(),
            FriendsTab(),
            WatchTab(),
            Expanded(child: MarketplaceTab()),
            NotificationsTab(),
            MenuTab(),
          ],
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon, {String? badge}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE4E6EB),
            child: Icon(icon, color: Colors.black),
          ),
          if (badge != null)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _NotificationTab extends StatelessWidget {
  const _NotificationTab();

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Stack(
        clipBehavior: Clip.none,
        children: [const Icon(Icons.notifications_outlined, size: 28)],
      ),
    );
  }
}
