import 'package:flutter/material.dart';

class MarketplaceTab extends StatelessWidget {
  const MarketplaceTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = _dummyItems;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        title: const Text('Marketplace'),
        backgroundColor: const Color(0xFF1877F2),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search Marketplace',
                                  isDense: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Sell'),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 40,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _FilterPill(label: 'All'),
                    _FilterPill(label: 'Nearby'),
                    _FilterPill(label: 'Vehicles'),
                    _FilterPill(label: 'Electronics'),
                    _FilterPill(label: 'Home & Garden'),
                    _FilterPill(label: 'Clothing'),
                  ],
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
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _MarketplaceCard(item: item);
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

class MarketplaceItem {
  final String title;
  final String price;
  final String location;
  final String imageUrl;

  MarketplaceItem({
    required this.title,
    required this.price,
    required this.location,
    required this.imageUrl,
  });
}

final List<MarketplaceItem> _dummyItems = [
  MarketplaceItem(
    title: 'Gaming Chair',
    price: '\$80',
    location: '2 km away',
    imageUrl:
        'https://www.pinterest.com/pin/gear-5-luffy-from-one-piece--2040762327232188/',
  ),
  MarketplaceItem(
    title: 'iPhone 12',
    price: '\$450',
    location: '5 km away',
    imageUrl:
        'https://images.pexels.com/photos/788946/pexels-photo-788946.jpeg',
  ),
  MarketplaceItem(
    title: 'Sofa Set',
    price: '\$220',
    location: '3 km away',
    imageUrl:
        'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg',
  ),
  MarketplaceItem(
    title: 'Mountain Bike',
    price: '\$150',
    location: '8 km away',
    imageUrl:
        'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg',
  ),
  MarketplaceItem(
    title: 'Dining Table',
    price: '\$120',
    location: '6 km away',
    imageUrl:
        'https://images.pexels.com/photos/3958952/pexels-photo-3958952.jpeg',
  ),
  MarketplaceItem(
    title: 'Laptop',
    price: '\$600',
    location: '10 km away',
    imageUrl: 'https://images.pexels.com/photos/18105/pexels-photo.jpg',
  ),
];

class _MarketplaceCard extends StatelessWidget {
  final MarketplaceItem item;

  const _MarketplaceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 40),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.location,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
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

class _FilterPill extends StatelessWidget {
  final String label;

  const _FilterPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(label, style: const TextStyle(fontSize: 13)),
    );
  }
}
