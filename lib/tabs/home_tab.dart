import 'package:flutter/material.dart';

class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CreatePostBox(),
        SizedBox(height: 8),
        _StoriesSection(),
        SizedBox(height: 8),
        _PostCard(),
      ],
    );
  }
}

class _CreatePostBox extends StatelessWidget {
  const _CreatePostBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          const CircleAvatar(child: Icon(Icons.person)),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "What's on your mind?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.photo_library, color: Colors.green),
        ],
      ),
    );
  }
}

class _StoriesSection extends StatelessWidget {
  const _StoriesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _CreateStoryCard();
          }
          return _StoryCard(index: index);
        },
      ),
    );
  }
}

class _CreateStoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: const Center(child: Icon(Icons.person, size: 40)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Create story',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final int index;
  const _StoryCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          // Background of the story
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade600],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.all(2), // border around avatar
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // white border like FB
              ),
              child: const CircleAvatar(
                radius: 16,
                // Use backgroundImage for real profile picture:
                // backgroundImage: NetworkImage('https://...'),
                child: Icon(Icons.person, size: 18),
              ),
            ),
          ),

          // Story text at the bottom
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Story',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text(
              'User Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('4d · Public'),
            trailing: IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Most of the advertisements like this in Addis Ababa are dangerous traps.',
              style: TextStyle(fontSize: 15),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            height: 250,
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(Icons.image, size: 80, color: Colors.grey),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                Icon(Icons.thumb_up, size: 16, color: Colors.blue),
                SizedBox(width: 6),
                Text('120'),
                Spacer(),
                Text('35 comments'),
              ],
            ),
          ),

          Divider(height: 1),

          // Action buttons
          Row(
            children: const [
              _PostAction(icon: Icons.thumb_up_alt_outlined, label: 'Like'),
              _PostAction(icon: Icons.chat_bubble_outline, label: 'Comment'),
              _PostAction(icon: Icons.share_outlined, label: 'Share'),
            ],
          ),
        ],
      ),
    );
  }
}

class _PostAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PostAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: Colors.grey),
              const SizedBox(width: 6),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
