import 'package:flutter/material.dart';
import '../widgets/empty_page.dart';

class WatchTab extends StatelessWidget {
  const WatchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyPage(title: 'Watch', icon: Icons.ondemand_video);
  }
}
