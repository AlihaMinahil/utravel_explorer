import 'package:flutter/material.dart';
import 'destination_detail_screen.dart'; // Detail screen import ki gai hai

class DestinationExplorerScreen extends StatefulWidget {
  const DestinationExplorerScreen({Key? key}) : super(key: key);

  @override
  State<DestinationExplorerScreen> createState() => _DestinationExplorerScreenState();
}

class _DestinationExplorerScreenState extends State<DestinationExplorerScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _searchQuery = '';

  final List<String> categories = const [
    'All',
    'Mountains',
    'Lakes',
    'Historical',
    'Beach',
    'Nature',
    'City'
  ];

  final List<Map<String, dynamic>> destinations = const [
    {
      'title': 'Swiss Alps',
      'location': 'Switzerland',
      'category': 'Mountains',
      'rating': '4.9',
      'description':
      'The Swiss Alps are the highest mountain range in Europe. They are known for their stunning beauty, snow-capped peaks, lush green valleys, and adventure activities.',
      'image':
      'https://images.unsplash.com/photo-1530122037265-a5f1f91d3b99?q=80&w=1000&auto=format&fit=crop',
      'highlights': [
        {'icon': Icons.hiking, 'label': 'Hiking'},
        {'icon': Icons.downhill_skiing, 'label': 'Skiing'},
        {'icon': Icons.sailing, 'label': 'Lakes'},
        {'icon': Icons.filter_hdr, 'label': 'Scenery'},
      ],
    },
    {
      'title': 'Lake Bled',
      'location': 'Slovenia',
      'category': 'Lakes',
      'rating': '4.8',
      'description':
      'Lake Bled is a glacial lake in the Julian Alps of northwestern Slovenia. It is famous for its iconic island, medieval castle, and serene blue waters.',
      'image':
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1000&auto=format&fit=crop',
      'highlights': [
        {'icon': Icons.directions_boat, 'label': 'Boating'},
        {'icon': Icons.castle, 'label': 'Castle'},
        {'icon': Icons.landscape, 'label': 'Scenery'},
        {'icon': Icons.hiking, 'label': 'Hiking'},
      ],
    },
    {
      'title': 'Paris',
      'location': 'France',
      'category': 'Historical',
      'rating': '4.7',
      'description':
      'Paris, France\'s capital, is a major European city and a global center for art, fashion, gastronomy and culture.',
      'image':
      'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?q=80&w=1000&auto=format&fit=crop',
      'highlights': [
        {'icon': Icons.account_balance, 'label': 'Museums'},
        {'icon': Icons.restaurant, 'label': 'Dining'},
        {'icon': Icons.photo_camera, 'label': 'Sights'},
        {'icon': Icons.shopping_bag, 'label': 'Shopping'},
      ],
    },
    {
      'title': 'Santorini',
      'location': 'Greece',
      'category': 'Beach',
      'rating': '4.9',
      'description':
      'Santorini is one of the Cyclades islands in the Aegean Sea. It is famous for its whitewashed, cubiform houses and stunning sunsets.',
      'image':
      'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?q=80&w=1000&auto=format&fit=crop',
      'highlights': [
        {'icon': Icons.wb_sunny, 'label': 'Sunsets'},
        {'icon': Icons.beach_access, 'label': 'Beaches'},
        {'icon': Icons.pool, 'label': 'Resorts'},
        {'icon': Icons.sailing, 'label': 'Cruises'},
      ],
    },
    {
      'title': 'Bali',
      'location': 'Indonesia',
      'category': 'Nature',
      'rating': '4.8',
      'description':
      'Bali is an Indonesian island known for its forested volcanic mountains, iconic rice paddies, beaches and coral reefs.',
      'image':
      'https://images.unsplash.com/photo-1537996194471-e657df975ab4?q=80&w=1000&auto=format&fit=crop',
      'highlights': [
        {'icon': Icons.surfing, 'label': 'Surfing'},
        {'icon': Icons.spa, 'label': 'Wellness'},
        {'icon': Icons.temple_hindu, 'label': 'Temples'},
        {'icon': Icons.beach_access, 'label': 'Beaches'},
      ],
    },
  ];

  // Search & Filter Logic
  List<Map<String, dynamic>> get _filteredDestinations {
    return destinations.where((item) {
      final matchesCategory = _selectedCategory == 'All' ||
          item['category'].toString().toLowerCase() == _selectedCategory.toLowerCase();

      final matchesSearch = item['title']
          .toString()
          .toLowerCase()
          .contains(_searchQuery.toLowerCase()) ||
          item['location']
              .toString()
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: const Text(
          'Destination Explorer',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE8F0FE), Color(0xFFF8FAFC), Color(0xFFF1F5F9)],
          ),
        ),
        child: Column(
          children: [
            // 1. Search Bar Component
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search by name or location...',
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF2563EB)),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchQuery = '';
                      });
                    },
                  )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // 2. Category Filter Chips (Horizontal List)
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = _selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: const Color(0xFF2563EB),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF0F172A),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedCategory = cat;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // 3. Destination Cards List
            Expanded(
              child: _filteredDestinations.isEmpty
                  ? const Center(
                child: Text(
                  'No destinations found!',
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 16),
                ),
              )
                  : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: _filteredDestinations.length,
                itemBuilder: (context, index) {
                  final item = _filteredDestinations[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 3,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DestinationDetailScreen(destination: item),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                item['image'],
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0F172A),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.star,
                                              color: Colors.amber, size: 16),
                                          const SizedBox(width: 2),
                                          Text(
                                            item['rating'],
                                            style: const TextStyle(
                                                fontSize: 12, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          size: 14, color: Color(0xFF2563EB)),
                                      const SizedBox(width: 2),
                                      Text(
                                        item['location'],
                                        style: const TextStyle(
                                            fontSize: 12, color: Color(0xFF64748B)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0E7FF),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      item['category'],
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF2563EB),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}