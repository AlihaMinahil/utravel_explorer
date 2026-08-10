import 'package:flutter/material.dart';

class RecentlyViewedScreen extends StatefulWidget {
  const RecentlyViewedScreen({super.key});

  @override
  State<RecentlyViewedScreen> createState() => _RecentlyViewedScreenState();
}

class _RecentlyViewedScreenState extends State<RecentlyViewedScreen> {
  int selectedIndex = 3;

  // TYPE MATCHED: List<Map<String, dynamic>>
  final List<Map<String, dynamic>> recentDestinations = [
    {
      'title': 'Swiss Alps',
      'location': 'Switzerland',
      'rating': '4.9',
      'category': 'Mountains',
      'image': 'https://images.unsplash.com/photo-1530122037265-a5f1f91d3b99?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Lake Bled',
      'location': 'Slovenia',
      'rating': '4.8',
      'category': 'Lakes',
      'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Paris',
      'location': 'France',
      'rating': '4.7',
      'category': 'Historical',
      'image': 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Santorini',
      'location': 'Greece',
      'rating': '4.9',
      'category': 'Beach',
      'image': 'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Bali',
      'location': 'Indonesia',
      'rating': '4.8',
      'category': 'Nature',
      'image': 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Dubai',
      'location': 'United Arab Emirates',
      'rating': '4.8',
      'category': 'City',
      'image': 'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'New York',
      'location': 'United States',
      'rating': '4.7',
      'category': 'City',
      'image': 'https://images.unsplash.com/photo-1485871981521-5b1fd3805eee?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Tokyo',
      'location': 'Japan',
      'rating': '4.8',
      'category': 'City',
      'image': 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Iceland',
      'location': 'Iceland',
      'rating': '4.9',
      'category': 'Nature',
      'image': 'https://images.unsplash.com/photo-1504829857797-ddff29c27927?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Cappadocia',
      'location': 'Turkey',
      'rating': '4.8',
      'category': 'Nature',
      'image': 'https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?q=80&w=1000&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F8FC),
      body: Column(
        children: [
          // HEADER (Pura Top Status Bar Area Cover Karta Hai)
          _buildHeader(context),

          // SECTION TITLE
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recently Viewed',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff172842),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xffE8F0FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${recentDestinations.length} places',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff075BE8),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // LISTVIEW (Full Remaining Screen Fill Karega)
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
                physics: const BouncingScrollPhysics(),
                itemCount: recentDestinations.length,
                itemBuilder: (context, index) {
                  final destination = recentDestinations[index];
                  return _destinationCard(
                    title: destination['title']?.toString() ?? 'Destination',
                    location: destination['location']?.toString() ?? 'Location',
                    rating: destination['rating']?.toString() ?? '4.5',
                    category: destination['category']?.toString() ?? 'General',
                    image: destination['image']?.toString() ?? '',
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // ============================================================
  // HEADER WIDGET
  // ============================================================
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        bottom: 14,
        left: 10,
        right: 12,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xff082B57),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Recently Viewed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Places you explored recently',
                  style: TextStyle(color: Color(0xffC8D8EC), fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.history, color: Colors.white, size: 19),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DESTINATION CARD
  // ============================================================
  Widget _destinationCard({
    required String title,
    required String location,
    required String rating,
    required String category,
    required String image,
  }) {
    return Container(
      height: 96,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // IMAGE SECTION
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(13),
              bottomLeft: Radius.circular(13),
            ),
            child: SizedBox(
              width: 92,
              height: 96,
              child: Image.network(
                image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: const Color(0xffE8F0FA),
                    child: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xff075BE8),
                        ),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xffE8F0FA),
                    child: const Center(
                      child: Icon(
                        Icons.image_outlined,
                        color: Color(0xff527399),
                        size: 28,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 11),

          // DETAILS SECTION
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff172842),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 13, color: Color(0xff536176)),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 10, color: Color(0xff697589)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 13, color: Color(0xffffb000)),
                      const SizedBox(width: 3),
                      Text(
                        rating,
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xff536176)),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
                        decoration: BoxDecoration(
                          color: const Color(0xffEAF1FF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          category,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xff075BE8)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ACTION BUTTON
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xffF1F5F9),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.history, size: 18, color: Color(0xff697589)),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION BAR
  // ============================================================
  Widget _buildBottomNavigationBar() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(icon: Icons.home_outlined, label: 'Home', index: 0),
          _navItem(icon: Icons.explore_outlined, label: 'Explore', index: 1),
          _navItem(icon: Icons.favorite_border, label: 'Favorites', index: 2),
          _navItem(icon: Icons.history, label: 'Recent', index: 3),
          _navItem(icon: Icons.person_outline, label: 'Profile', index: 4),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool selected = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: selected ? const Color(0xff075BE8) : const Color(0xff697589),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                color: selected ? const Color(0xff075BE8) : const Color(0xff697589),
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}