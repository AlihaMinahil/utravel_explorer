import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedIndex = 2;

  // ============================================================
  // FAVORITE PLACES
  // DIRECT IMAGE URLS ONLY
  // ============================================================

  final List<Map<String, dynamic>> favorites = [
    {
      'title': 'Swiss Alps',
      'location': 'Switzerland',
      'rating': '4.9',
      'category': 'Mountains',
      'image':
      'https://images.unsplash.com/photo-1530122037265-a5f1f91d3b99?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Lake Bled',
      'location': 'Slovenia',
      'rating': '4.8',
      'category': 'Lakes',
      'image':
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Paris',
      'location': 'France',
      'rating': '4.7',
      'category': 'Historical',
      'image':
      'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Santorini',
      'location': 'Greece',
      'rating': '4.9',
      'category': 'Beach',
      'image':
      'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Bali',
      'location': 'Indonesia',
      'rating': '4.8',
      'category': 'Nature',
      'image':
      'https://images.unsplash.com/photo-1537996194471-e657df975ab4?q=80&w=1000&auto=format&fit=crop',
    },

    // ============================================================
    // MORE PLACES
    // ============================================================

    {
      'title': 'Dubai',
      'location': 'United Arab Emirates',
      'rating': '4.8',
      'category': 'City',
      'image':
      'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'New York',
      'location': 'United States',
      'rating': '4.7',
      'category': 'City',
      'image':
      'https://images.unsplash.com/photo-1485871981521-5b1fd3805eee?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Tokyo',
      'location': 'Japan',
      'rating': '4.8',
      'category': 'City',
      'image':
      'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Iceland',
      'location': 'Iceland',
      'rating': '4.9',
      'category': 'Nature',
      'image':
      'https://images.unsplash.com/photo-1504829857797-ddff29c27927?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'title': 'Cappadocia',
      'location': 'Turkey',
      'rating': '4.8',
      'category': 'Nature',
      'image':
      'https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?q=80&w=1000&auto=format&fit=crop',
    },
  ];

  // ============================================================
  // REMOVE FAVORITE
  // ============================================================

  void removeFavorite(int index) {
    final String removedPlace =
        favorites[index]['title']?.toString() ?? 'Place';

    setState(() {
      favorites.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$removedPlace removed from favorites',
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F8FC),

      body: SafeArea(
        child: Column(
          children: [
            // ==================================================
            // HEADER
            // ==================================================

            _buildHeader(),

            // ==================================================
            // CONTENT
            // ==================================================

            Expanded(
              child: favorites.isEmpty
                  ? _buildEmptyState()
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ==================================================
                  // SECTION TITLE
                  // ==================================================

                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      14,
                      16,
                      9,
                    ),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Saved Places',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff172842),
                          ),
                        ),

                        // Places count
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffE8F0FF),
                            borderRadius:
                            BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${favorites.length} places',
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff075BE8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ==================================================
                  // LIST
                  // ==================================================

                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        12,
                        0,
                        12,
                        12,
                      ),
                      physics:
                      const BouncingScrollPhysics(),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final destination =
                        favorites[index];

                        return _destinationCard(
                          index: index,
                          title: destination['title']
                              ?.toString() ??
                              'Unknown Place',
                          location: destination['location']
                              ?.toString() ??
                              'Unknown Location',
                          rating: destination['rating']
                              ?.toString() ??
                              '0.0',
                          category: destination['category']
                              ?.toString() ??
                              'Travel',
                          image: destination['image']
                              ?.toString() ??
                              '',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ============================================================
      // BOTTOM NAVIGATION
      // ============================================================

      bottomNavigationBar:
      _buildBottomNavigationBar(),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Container(
      height: 68,
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
          const SizedBox(width: 10),

          // Back button
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Header text
          const Expanded(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'Favorites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Your saved destinations',
                  style: TextStyle(
                    color: Color(0xffC8D8EC),
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),

          // Heart
          Container(
            margin:
            const EdgeInsets.only(right: 12),
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color:
              Colors.white.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 19,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DESTINATION CARD
  // ============================================================

  Widget _destinationCard({
    required int index,
    required String title,
    required String location,
    required String rating,
    required String category,
    required String image,
  }) {
    return Container(
      height: 96,
      margin:
      const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color:
            Colors.black.withOpacity(0.06),
            blurRadius: 7,
            offset:
            const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // ==================================================
          // IMAGE
          // ==================================================

          ClipRRect(
            borderRadius:
            const BorderRadius.only(
              topLeft: Radius.circular(13),
              bottomLeft:
              Radius.circular(13),
            ),
            child: SizedBox(
              width: 92,
              height: 96,
              child: image.isNotEmpty
                  ? Image.network(
                image,
                width: 92,
                height: 96,
                fit: BoxFit.cover,

                // Loading
                loadingBuilder:
                    (
                    context,
                    child,
                    loadingProgress,
                    ) {
                  if (loadingProgress ==
                      null) {
                    return child;
                  }

                  return Container(
                    color:
                    const Color(
                      0xffE8F0FA,
                    ),
                    child:
                    const Center(
                      child:
                      SizedBox(
                        width: 20,
                        height: 20,
                        child:
                        CircularProgressIndicator(
                          strokeWidth: 2,
                          color:
                          Color(
                            0xff075BE8,
                          ),
                        ),
                      ),
                    ),
                  );
                },

                // Error
                errorBuilder:
                    (
                    context,
                    error,
                    stackTrace,
                    ) {
                  return _imageErrorWidget();
                },
              )
                  : _imageErrorWidget(),
            ),
          ),

          const SizedBox(width: 11),

          // ==================================================
          // DETAILS
          // ==================================================

          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    title,
                    maxLines: 1,
                    overflow:
                    TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight:
                      FontWeight.bold,
                      color:
                      Color(0xff172842),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .location_on_outlined,
                        size: 13,
                        color:
                        Color(0xff536176),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow:
                          TextOverflow.ellipsis,
                          style:
                          const TextStyle(
                            fontSize: 9,
                            color:
                            Color(0xff697589),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Rating + Category
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 13,
                        color:
                        Color(0xffffb000),
                      ),

                      const SizedBox(width: 3),

                      Text(
                        rating,
                        style:
                        const TextStyle(
                          fontSize: 9,
                          fontWeight:
                          FontWeight.w600,
                          color:
                          Color(0xff536176),
                        ),
                      ),

                      const SizedBox(width: 7),

                      Container(
                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 6,
                          vertical: 2.5,
                        ),
                        decoration:
                        BoxDecoration(
                          color:
                          const Color(
                            0xffEAF1FF,
                          ),
                          borderRadius:
                          BorderRadius
                              .circular(5),
                        ),
                        child: Text(
                          category,
                          maxLines: 1,
                          overflow:
                          TextOverflow
                              .ellipsis,
                          style:
                          const TextStyle(
                            fontSize: 7,
                            fontWeight:
                            FontWeight.bold,
                            color:
                            Color(0xff075BE8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ==================================================
          // FAVORITE BUTTON
          // ==================================================

          Padding(
            padding:
            const EdgeInsets.only(
              right: 9,
            ),
            child: GestureDetector(
              onTap: () {
                removeFavorite(index);
              },
              child: Container(
                width: 36,
                height: 36,
                decoration:
                const BoxDecoration(
                  color:
                  Color(0xffffeef1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite,
                  color:
                  Color(0xffE92D3F),
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // IMAGE ERROR
  // ============================================================

  Widget _imageErrorWidget() {
    return Container(
      color: const Color(0xffE8F0FA),
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          color: Color(0xff527399),
          size: 30,
        ),
      ),
    );
  }

  // ============================================================
  // EMPTY FAVORITES
  // ============================================================

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding:
        const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Container(
              width: 78,
              height: 78,
              decoration:
              const BoxDecoration(
                color: Color(0xffEAF1FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border,
                size: 40,
                color: Color(0xff075BE8),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'No Favorites Yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                FontWeight.bold,
                color:
                Color(0xff172842),
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Save your favorite destinations\n'
                  'and find them here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color:
                Color(0xff697589),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color:
            Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset:
            const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceAround,
        children: [
          _navItem(
            icon: Icons.home_outlined,
            label: 'Home',
            index: 0,
          ),

          _navItem(
            icon:
            Icons.explore_outlined,
            label: 'Explore',
            index: 1,
          ),

          _navItem(
            icon: Icons.favorite,
            label: 'Favorites',
            index: 2,
          ),

          _navItem(
            icon: Icons.history,
            label: 'Recent',
            index: 3,
          ),

          _navItem(
            icon:
            Icons.person_outline,
            label: 'Profile',
            index: 4,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // NAV ITEM
  // ============================================================

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool selected =
        selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: selected
                  ? const Color(
                  0xff075BE8)
                  : const Color(
                  0xff697589),
            ),

            const SizedBox(height: 3),

            Text(
              label,
              style: TextStyle(
                fontSize: 8,
                color: selected
                    ? const Color(
                    0xff075BE8)
                    : const Color(
                    0xff697589),
                fontWeight: selected
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}