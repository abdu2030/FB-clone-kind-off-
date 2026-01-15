import 'package:flutter/material.dart';

class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      children: [
        const _CreatePostBox(),
        const SizedBox(height: 8),
        const _StoriesSection(),
        const SizedBox(height: 8),
        // Sample posts with images
        _PostCard(
          userName: 'Alice Johnson',
          timeAgo: '2 hr',
          content:
              'Had a great hike today! The view at the top was worth every step.',
          imageUrl: 'https://picsum.photos/seed/pic1/600/300',
          likes: 42,
          comments: 5,
        ),
        const SizedBox(height: 8),
        _PostCard(
          userName: 'Tom Rivera',
          timeAgo: '4 hr',
          content: 'Trying out a new recipe tonight — fingers crossed!',
          imageUrl: 'https://picsum.photos/seed/pic2/600/300',
          likes: 18,
          comments: 3,
        ),
        const SizedBox(height: 8),
        _PostCard(
          userName: 'Maya Lee',
          timeAgo: 'Yesterday',
          content: 'Throwback to last summer. Can we go back already?',
          imageUrl: 'https://picsum.photos/seed/pic3/600/300',
          likes: 128,
          comments: 26,
        ),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(child: Icon(Icons.person)),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "What's on your mind?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_library),
            color: Colors.green[700],
          ),
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
  final String userName;
  final String timeAgo;
  final String content;
  final String? imageUrl;
  final int likes;
  final int comments;

  const _PostCard({
    required this.userName,
    required this.timeAgo,
    required this.content,
    this.imageUrl,
    this.likes = 0,
    this.comments = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?u=${userName.replaceAll(' ', '')}',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        timeAgo,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
          ),
          if (content.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(content),
            ),
          if (imageUrl != null) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: progress.expectedTotalBytes != null
                            ? progress.cumulativeBytesLoaded /
                                  progress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.blue[700], size: 18),
                    const SizedBox(width: 6),
                    Text('$likes'),
                    const SizedBox(width: 12),
                    Icon(Icons.comment, color: Colors.grey[700], size: 18),
                    const SizedBox(width: 6),
                    Text('$comments'),
                  ],
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_alt_outlined, size: 18),
                      label: const Text('Like'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined, size: 18),
                      label: const Text('Comment'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
