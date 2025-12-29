import 'package:flutter/material.dart';

class FriendsTab extends StatelessWidget {
  const FriendsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1877F2),
        elevation: 0,
        title: const Text('Friends'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: const [
                    _FilterChip(label: 'Suggestions', selected: true),
                    SizedBox(width: 8),
                    _FilterChip(label: 'Your Friends'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Friend requests',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('See All')),
                  ],
                ),
              ),

              const SizedBox(height: 4),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: _dummyFriendRequests
                      .map(
                        (r) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _FriendRequestCard(request: r),
                        ),
                      )
                      .toList(),
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const Text(
                  'People you may know',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: _dummySuggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = _dummySuggestions[index];
                    return _SuggestionCard(suggestion: suggestion);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FriendRequest {
  final String name;
  final String mutualFriends;
  final String avatarUrl;
  final String timeAgo;

  FriendRequest({
    required this.name,
    required this.mutualFriends,
    required this.avatarUrl,
    required this.timeAgo,
  });
}

class FriendSuggestion {
  final String name;
  final String mutualFriends;
  final String avatarUrl;

  FriendSuggestion({
    required this.name,
    required this.mutualFriends,
    required this.avatarUrl,
  });
}

final List<FriendRequest> _dummyFriendRequests = [
  FriendRequest(
    name: 'Alice Johnson',
    mutualFriends: '3 mutual friends',
    avatarUrl:
        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
    timeAgo: '2d',
  ),
  FriendRequest(
    name: 'Michael Smith',
    mutualFriends: '10 mutual friends',
    avatarUrl:
        'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
    timeAgo: '3h',
  ),
];

final List<FriendSuggestion> _dummySuggestions = [
  FriendSuggestion(
    name: 'Emma Davis',
    mutualFriends: '12 mutual friends',
    avatarUrl:
        'https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg',
  ),
  FriendSuggestion(
    name: 'John Carter',
    mutualFriends: '4 mutual friends',
    avatarUrl:
        'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg',
  ),
  FriendSuggestion(
    name: 'Sophia Lee',
    mutualFriends: '8 mutual friends',
    avatarUrl:
        'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg',
  ),
  FriendSuggestion(
    name: 'David Kim',
    mutualFriends: '2 mutual friends',
    avatarUrl:
        'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg',
  ),
];

class _FriendRequestCard extends StatelessWidget {
  final FriendRequest request;

  const _FriendRequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(request.avatarUrl),
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          request.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Text(
                        request.timeAgo,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    request.mutualFriends,
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1877F2),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                          ),
                          onPressed: () {},
                          child: const Text('Confirm'),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE4E6EB),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                          ),
                          onPressed: () {},
                          child: const Text('Delete'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuggestionCard extends StatelessWidget {
  final FriendSuggestion suggestion;

  const _SuggestionCard({required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Photo
          Expanded(
            child: Ink.image(
              image: NetworkImage(suggestion.avatarUrl),
              fit: BoxFit.cover,
              child: InkWell(onTap: () {}),
            ),
          ),
          // Info + buttons
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  suggestion.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  suggestion.mutualFriends,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1877F2),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                    ),
                    onPressed: () {},
                    child: const Text('Add Friend'),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE4E6EB),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                    ),
                    onPressed: () {},
                    child: const Text('Remove'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final bg = selected ? const Color(0xFF1877F2) : Colors.white;
    final fg = selected ? Colors.white : Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(color: fg, fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
