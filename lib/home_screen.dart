import 'package:flutter/material.dart';

import 'DestinationsScreen.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import 'recently_viewed_screen.dart';
import 'profile_screen.dart';
import 'my_trips_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _mainScrollController;

  int _selectedFilterIndex = 0;
  int _currentNavIndex = 0;

  final List<String> _filters = [
    'All',
    'Popular',
    'Recommended',
    'Trending',
    'Most Visited',
  ];

  final List<Map<String, String>> _popularPlaces = const [
    {
      'title': 'Bali',
      'location': 'Indonesia',
      'price': '\$450',
      'rating': '4.9',
      'image':
      'https://images.unsplash.com/photo-1537996194471-e657df975ab4?auto=format&fit=crop&w=800&q=80',
    },
    {
      'title': 'Santorini',
      'location': 'Greece',
      'price': '\$680',
      'rating': '4.8',
      'image':
      'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?auto=format&fit=crop&w=800&q=80',
    },
    {
      'title': 'Kyoto',
      'location': 'Japan',
      'price': '\$520',
      'rating': '4.7',
      'image':
      'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?auto=format&fit=crop&w=800&q=80',
    },
  ];

  @override
  void initState() {
    super.initState();
    _mainScrollController = ScrollController();
  }

  @override
  void dispose() {
    _mainScrollController.dispose();
    super.dispose();
  }

  // ============================================================
  // DESTINATIONS
  // ============================================================

  void _navigateToDestinations(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DestinationExplorerScreen(),
      ),
    );
  }

  // ============================================================
  // CATEGORIES
  // ============================================================

  void _navigateToCategories(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CategoriesScreen(),
      ),
    );
  }

  // ============================================================
  // FAVORITES
  // ============================================================

  void _navigateToFavorites(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FavoritesScreen(),
      ),
    );

    if (mounted) {
      setState(() {
        _currentNavIndex = 0;
      });
    }
  }

  // ============================================================
  // RECENTLY VIEWED
  // ============================================================

  void _navigateToRecentlyViewed(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RecentlyViewedScreen(),
      ),
    );

    if (mounted) {
      setState(() {
        _currentNavIndex = 0;
      });
    }
  }

  // ============================================================
  // PROFILE
  // ============================================================

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  // ============================================================
  // MY TRIPS
  // ============================================================

  void _navigateToMyTrips(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyTripsScreen(),
      ),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  void _onBottomNavTapped(int index) {
    // HOME
    if (index == 0) {
      setState(() {
        _currentNavIndex = 0;
      });
    }

    // EXPLORE
    else if (index == 1) {
      setState(() {
        _currentNavIndex = 1;
      });

      _navigateToDestinations(context);
    }

    // FAVORITES
    else if (index == 2) {
      setState(() {
        _currentNavIndex = 2;
      });

      _navigateToFavorites(context);
    }

    // RECENTLY VIEWED
    else if (index == 3) {
      setState(() {
        _currentNavIndex = 3;
      });

      _navigateToRecentlyViewed(context);
    }

    // PROFILE
    else if (index == 4) {
      setState(() {
        _currentNavIndex = 4;
      });

      _navigateToProfile(context);
    }
  }

  // ============================================================
  // CATEGORY CARD
  // ============================================================

  Widget _buildCategoryCard(
      BuildContext context,
      String title,
      IconData icon,
      Color color,
      ) {
    return GestureDetector(
      onTap: () => _navigateToCategories(context),
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 22,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0F172A),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      // ========================================================
      // BODY
      // ========================================================

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE8F0FE),
              Color(0xFFF8FAFC),
              Color(0xFFF1F5F9),
            ],
            stops: [0.0, 0.4, 1.0],
          ),
        ),

        child: SafeArea(
          bottom: false,

          child: Scrollbar(
            controller: _mainScrollController,
            thumbVisibility: true,
            thickness: 6,
            radius: const Radius.circular(10),

            child: SingleChildScrollView(
              controller: _mainScrollController,

              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),

              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // ==================================================
                  // 1. TOP BAR
                  // ==================================================

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [

                          Container(
                            padding: const EdgeInsets.all(2),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              border: Border.all(
                                color: const Color(0xFF2563EB)
                                    .withOpacity(0.25),
                                width: 2.5,
                              ),
                            ),

                            child: const CircleAvatar(
                              radius: 20,

                              backgroundImage:
                              NetworkImage(
                                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=400&q=80',
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          const Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [
                              Text(
                                'Welcome back,',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight.w500,
                                  color:
                                  Color(0xFF64748B),
                                ),
                              ),

                              SizedBox(height: 2),

                              Text(
                                'Explorer',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                  FontWeight.bold,
                                  color:
                                  Color(0xFF0F172A),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Container(
                        height: 44,
                        width: 44,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.06),
                              blurRadius: 12,
                              offset:
                              const Offset(0, 4),
                            ),
                          ],
                        ),

                        child: IconButton(
                          padding: EdgeInsets.zero,

                          icon: const Icon(
                            Icons
                                .notifications_none_rounded,
                            size: 24,
                            color:
                            Color(0xFF0F172A),
                          ),

                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // ==================================================
                  // 2. MAIN HEADING
                  // ==================================================

                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Explore\n',
                          style: TextStyle(
                            fontFamily: 'serif',
                            fontSize: 38,
                            fontStyle:
                            FontStyle.italic,
                            fontWeight:
                            FontWeight.w500,
                            color:
                            Color(0xFF0F172A),
                            height: 1.1,
                          ),
                        ),

                        TextSpan(
                          text: 'the World',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight:
                            FontWeight.w900,
                            color:
                            Color(0xFF0F172A),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // ==================================================
                  // 3. SEARCH BAR
                  // ==================================================

                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(30),

                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2563EB)
                              .withOpacity(0.08),
                          blurRadius: 20,
                          offset:
                          const Offset(0, 8),
                        ),
                      ],
                    ),

                    child: const TextField(
                      decoration:
                      InputDecoration(
                        icon: Icon(
                          Icons.search_rounded,
                          color:
                          Color(0xFF2563EB),
                          size: 26,
                        ),

                        hintText:
                        'Search destinations...',

                        hintStyle:
                        TextStyle(
                          color:
                          Color(0xFF94A3B8),
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w400,
                        ),

                        border:
                        InputBorder.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // ⭐ MY TRIPS BUTTON
                  // ==================================================

                  GestureDetector(
                    onTap: () =>
                        _navigateToMyTrips(context),

                    child: Container(
                      width: double.infinity,

                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 16,
                      ),

                      decoration:
                      BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.circular(20),

                        boxShadow: [
                          BoxShadow(
                            color:
                            const Color(0xFF2563EB)
                                .withOpacity(0.08),
                            blurRadius: 15,
                            offset:
                            const Offset(0, 6),
                          ),
                        ],

                        border: Border.all(
                          color:
                          const Color(0xFFE2E8F0),
                        ),
                      ),

                      child: Row(
                        children: [

                          // ICON
                          Container(
                            height: 48,
                            width: 48,

                            decoration:
                            BoxDecoration(
                              color:
                              const Color(
                                0xFF2563EB,
                              ).withOpacity(0.10),

                              borderRadius:
                              BorderRadius.circular(
                                14,
                              ),
                            ),

                            child: const Icon(
                              Icons
                                  .luggage_rounded,
                              color:
                              Color(0xFF2563EB),
                              size: 26,
                            ),
                          ),

                          const SizedBox(width: 14),

                          // TEXT
                          const Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [
                                Text(
                                  'My Trips',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.w800,
                                    color:
                                    Color(0xFF0F172A),
                                  ),
                                ),

                                SizedBox(height: 4),

                                Text(
                                  'Plan and manage your trips',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                    Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // ARROW
                          Container(
                            height: 38,
                            width: 38,

                            decoration:
                            BoxDecoration(
                              color:
                              const Color(
                                0xFF2563EB,
                              ),

                              borderRadius:
                              BorderRadius.circular(
                                12,
                              ),
                            ),

                            child: const Icon(
                              Icons
                                  .arrow_forward_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // 4. FILTERS
                  // ==================================================

                  SizedBox(
                    height: 40,

                    child: ListView.builder(
                      scrollDirection:
                      Axis.horizontal,

                      physics:
                      const BouncingScrollPhysics(),

                      itemCount:
                      _filters.length,

                      itemBuilder:
                          (context, index) {
                        final bool isSelected =
                            _selectedFilterIndex ==
                                index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedFilterIndex =
                                  index;
                            });
                          },

                          child:
                          AnimatedContainer(
                            duration:
                            const Duration(
                              milliseconds: 200,
                            ),

                            margin:
                            const EdgeInsets.only(
                              right: 12,
                            ),

                            padding:
                            const EdgeInsets
                                .symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),

                            decoration:
                            BoxDecoration(
                              color: isSelected
                                  ? const Color(
                                  0xFF0F172A)
                                  : Colors.white,

                              borderRadius:
                              BorderRadius.circular(
                                20,
                              ),

                              boxShadow:
                              isSelected
                                  ? [
                                BoxShadow(
                                  color: const Color(
                                    0xFF0F172A,
                                  ).withOpacity(
                                    0.3,
                                  ),
                                  blurRadius: 12,
                                  offset:
                                  const Offset(
                                    0,
                                    4,
                                  ),
                                ),
                              ]
                                  : [
                                BoxShadow(
                                  color: Colors
                                      .black
                                      .withOpacity(
                                    0.03,
                                  ),
                                  blurRadius: 5,
                                  offset:
                                  const Offset(
                                    0,
                                    2,
                                  ),
                                ),
                              ],

                              border:
                              Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : const Color(
                                  0xFFE2E8F0,
                                ),
                              ),
                            ),

                            child: Center(
                              child: Text(
                                _filters[index],

                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(
                                    0xFF475569,
                                  ),

                                  fontSize: 14,

                                  fontWeight:
                                  isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ==================================================
                  // 5. FEATURED DESTINATION
                  // ==================================================

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [
                      const Text(
                        'Featured Destination',

                        style: TextStyle(
                          fontSize: 19,
                          fontWeight:
                          FontWeight.w800,
                          color:
                          Color(0xFF0F172A),
                        ),
                      ),

                      TextButton(
                        onPressed: () =>
                            _navigateToDestinations(
                              context,
                            ),

                        child: const Text(
                          'View All',

                          style: TextStyle(
                            color:
                            Color(0xFF2563EB),
                            fontSize: 14,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  GestureDetector(
                    onTap: () =>
                        _navigateToDestinations(
                          context,
                        ),

                    child: Container(
                      decoration:
                      BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.circular(
                          24,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.08),
                            blurRadius: 20,
                            offset:
                            const Offset(0, 10),
                          ),
                        ],
                      ),

                      child: Column(
                        children: [

                          Stack(
                            children: [

                              ClipRRect(
                                borderRadius:
                                const BorderRadius
                                    .vertical(
                                  top:
                                  Radius.circular(
                                    24,
                                  ),
                                ),

                                child:
                                Image.network(
                                  'https://images.unsplash.com/photo-1530122037265-a5f1f91d3b99?q=80&w=1000&auto=format&fit=crop',

                                  height: 190,
                                  width:
                                  double.infinity,

                                  fit: BoxFit.cover,
                                ),
                              ),

                              Positioned(
                                top: 14,
                                right: 14,

                                child: Container(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),

                                  decoration:
                                  BoxDecoration(
                                    color: Colors.black
                                        .withOpacity(
                                      0.4,
                                    ),

                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      20,
                                    ),

                                    border:
                                    Border.all(
                                      color: Colors.white
                                          .withOpacity(
                                        0.2,
                                      ),
                                    ),
                                  ),

                                  child: const Row(
                                    children: [

                                      Icon(
                                        Icons
                                            .location_on,
                                        color:
                                        Colors.white,
                                        size: 14,
                                      ),

                                      SizedBox(width: 4),

                                      Text(
                                        'Switzerland',

                                        style:
                                        TextStyle(
                                          color:
                                          Colors.white,
                                          fontSize: 12,
                                          fontWeight:
                                          FontWeight
                                              .w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.all(
                              18,
                            ),

                            child: Row(
                              children: [

                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                    children: [

                                      Text(
                                        'Swiss Alps',

                                        style:
                                        TextStyle(
                                          fontSize: 19,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          color:
                                          Color(
                                            0xFF0F172A,
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 6),

                                      Text(
                                        'Experience the most beautiful mountain ranges in the world.',

                                        style:
                                        TextStyle(
                                          fontSize: 13,
                                          color:
                                          Color(
                                            0xFF64748B,
                                          ),
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  width: 14,
                                ),

                                Container(
                                  height: 48,
                                  width: 48,

                                  decoration:
                                  BoxDecoration(
                                    color:
                                    const Color(
                                      0xFF0F172A,
                                    ),

                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      14,
                                    ),
                                  ),

                                  child: const Icon(
                                    Icons
                                        .arrow_forward_rounded,
                                    color:
                                    Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ==================================================
                  // 6. PROMOTIONAL BANNER
                  // ==================================================

                  Container(
                    padding:
                    const EdgeInsets.all(20),

                    decoration:
                    BoxDecoration(
                      gradient:
                      const LinearGradient(
                        colors: [
                          Color(0xFF2563EB),
                          Color(0xFF1D4ED8),
                        ],

                        begin:
                        Alignment.topLeft,

                        end:
                        Alignment.bottomRight,
                      ),

                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: Row(
                      children: [

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: [

                              Text(
                                'Special Offer! ✈️',

                                style:
                                TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 17,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),

                              SizedBox(height: 6),

                              Text(
                                'Get 20% discount on your first booking with us.',

                                style:
                                TextStyle(
                                  color:
                                  Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {},

                          style:
                          ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            Colors.white,

                            foregroundColor:
                            const Color(
                              0xFF2563EB,
                            ),

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                12,
                              ),
                            ),

                            elevation: 0,
                          ),

                          child:
                          const Text(
                            'Claim',

                            style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ==================================================
                  // 7. TOP CATEGORIES
                  // ==================================================

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [

                      const Text(
                        'Top Categories',

                        style: TextStyle(
                          fontSize: 19,
                          fontWeight:
                          FontWeight.w800,
                          color:
                          Color(0xFF0F172A),
                        ),
                      ),

                      TextButton(
                        onPressed: () =>
                            _navigateToCategories(
                              context,
                            ),

                        child: const Text(
                          'View All',

                          style: TextStyle(
                            color:
                            Color(0xFF2563EB),
                            fontSize: 14,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 105,

                    child: ListView(
                      scrollDirection:
                      Axis.horizontal,

                      physics:
                      const BouncingScrollPhysics(),

                      children: [

                        _buildCategoryCard(
                          context,
                          'Beach',
                          Icons.beach_access_rounded,
                          const Color(0xFF06B6D4),
                        ),

                        _buildCategoryCard(
                          context,
                          'Mountains',
                          Icons.landscape_rounded,
                          const Color(0xFF3B82F6),
                        ),

                        _buildCategoryCard(
                          context,
                          'Adventure',
                          Icons.hiking_rounded,
                          const Color(0xFFF97316),
                        ),

                        _buildCategoryCard(
                          context,
                          'Historical',
                          Icons.account_balance_rounded,
                          const Color(0xFFA855F7),
                        ),

                        _buildCategoryCard(
                          context,
                          'Desert',
                          Icons.wb_sunny_rounded,
                          const Color(0xFFEAB308),
                        ),

                        _buildCategoryCard(
                          context,
                          'Camping',
                          Icons.campaign_rounded,
                          const Color(0xFF10B981),
                        ),

                        _buildCategoryCard(
                          context,
                          'Forest',
                          Icons.park_rounded,
                          const Color(0xFF059669),
                        ),

                        _buildCategoryCard(
                          context,
                          'City',
                          Icons.location_city_rounded,
                          const Color(0xFF6366F1),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ==================================================
                  // 8. POPULAR PLACES
                  // ==================================================

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [

                      const Text(
                        'Popular Places',

                        style: TextStyle(
                          fontSize: 19,
                          fontWeight:
                          FontWeight.w800,
                          color:
                          Color(0xFF0F172A),
                        ),
                      ),

                      TextButton(
                        onPressed: () =>
                            _navigateToDestinations(
                              context,
                            ),

                        child: const Text(
                          'See More',

                          style: TextStyle(
                            color:
                            Color(0xFF2563EB),
                            fontSize: 14,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 255,

                    child: ListView.builder(
                      scrollDirection:
                      Axis.horizontal,

                      physics:
                      const BouncingScrollPhysics(),

                      itemCount:
                      _popularPlaces.length,

                      itemBuilder:
                          (context, index) {

                        final place =
                        _popularPlaces[index];

                        return GestureDetector(
                          onTap: () =>
                              _navigateToDestinations(
                                context,
                              ),

                          child: Container(
                            width: 175,

                            margin:
                            const EdgeInsets.only(
                              right: 16,
                              bottom: 8,
                            ),

                            decoration:
                            BoxDecoration(
                              color: Colors.white,

                              borderRadius:
                              BorderRadius
                                  .circular(
                                20,
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(
                                    0.06,
                                  ),
                                  blurRadius: 15,
                                  offset:
                                  const Offset(
                                    0,
                                    6,
                                  ),
                                ),
                              ],
                            ),

                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                ClipRRect(
                                  borderRadius:
                                  const BorderRadius
                                      .vertical(
                                    top:
                                    Radius.circular(
                                      20,
                                    ),
                                  ),

                                  child:
                                  Image.network(
                                    place['image']!,

                                    height: 125,

                                    width:
                                    double.infinity,

                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .all(
                                    12,
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                    children: [

                                      Text(
                                        place['title']!,

                                        style:
                                        const TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          color:
                                          Color(
                                            0xFF0F172A,
                                          ),
                                        ),

                                        maxLines: 1,

                                        overflow:
                                        TextOverflow
                                            .ellipsis,
                                      ),

                                      const SizedBox(
                                        height: 4,
                                      ),

                                      Row(
                                        children: [

                                          const Icon(
                                            Icons
                                                .location_on,
                                            size: 13,
                                            color:
                                            Color(
                                              0xFF94A3B8,
                                            ),
                                          ),

                                          const SizedBox(
                                            width: 4,
                                          ),

                                          Expanded(
                                            child: Text(
                                              place[
                                              'location']!,

                                              style:
                                              const TextStyle(
                                                fontSize:
                                                12,
                                                color:
                                                Color(
                                                  0xFF64748B,
                                                ),
                                              ),

                                              maxLines: 1,

                                              overflow:
                                              TextOverflow
                                                  .ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,

                                        children: [

                                          Text(
                                            place[
                                            'price']!,

                                            style:
                                            const TextStyle(
                                              fontSize: 15,
                                              fontWeight:
                                              FontWeight
                                                  .w800,
                                              color:
                                              Color(
                                                0xFF2563EB,
                                              ),
                                            ),
                                          ),

                                          Container(
                                            padding:
                                            const EdgeInsets
                                                .symmetric(
                                              horizontal: 6,
                                              vertical: 3,
                                            ),

                                            decoration:
                                            BoxDecoration(
                                              color:
                                              const Color(
                                                0xFFFFFBEB,
                                              ),

                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                6,
                                              ),
                                            ),

                                            child: Row(
                                              children: [

                                                const Icon(
                                                  Icons
                                                      .star_rounded,
                                                  size: 14,
                                                  color:
                                                  Colors
                                                      .amber,
                                                ),

                                                const SizedBox(
                                                  width: 4,
                                                ),

                                                Text(
                                                  place[
                                                  'rating']!,

                                                  style:
                                                  const TextStyle(
                                                    fontSize:
                                                    12,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    color:
                                                    Color(
                                                      0xFFB45309,
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                      },
                    ),
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ),

      // ============================================================
      // FLOATING BOTTOM NAVIGATION
      // ============================================================

      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),

        height: 65,

        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),

          borderRadius:
          BorderRadius.circular(30),

          boxShadow: [
            BoxShadow(
              color:
              Colors.black.withOpacity(0.20),
              blurRadius: 20,
              offset:
              const Offset(0, 10),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,

          children: [

            // HOME
            IconButton(
              onPressed: () {
                _onBottomNavTapped(0);
              },

              icon: Icon(
                _currentNavIndex == 0
                    ? Icons.home_rounded
                    : Icons.home_outlined,

                color: _currentNavIndex == 0
                    ? const Color(0xFF3B82F6)
                    : Colors.white60,

                size: 26,
              ),
            ),

            // EXPLORE
            IconButton(
              onPressed: () {
                _onBottomNavTapped(1);
              },

              icon: Icon(
                _currentNavIndex == 1
                    ? Icons.explore_rounded
                    : Icons.explore_outlined,

                color: _currentNavIndex == 1
                    ? const Color(0xFF3B82F6)
                    : Colors.white60,

                size: 26,
              ),
            ),

            // FAVORITES
            IconButton(
              onPressed: () {
                _onBottomNavTapped(2);
              },

              icon: Icon(
                _currentNavIndex == 2
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,

                color: _currentNavIndex == 2
                    ? const Color(0xFFEF4444)
                    : Colors.white60,

                size: 25,
              ),
            ),

            // RECENT
            IconButton(
              onPressed: () {
                _onBottomNavTapped(3);
              },

              icon: Icon(
                Icons.history_rounded,

                color: _currentNavIndex == 3
                    ? const Color(0xFF3B82F6)
                    : Colors.white60,

                size: 25,
              ),
            ),

            // PROFILE
            IconButton(
              onPressed: () {
                _onBottomNavTapped(4);
              },

              icon: Icon(
                _currentNavIndex == 4
                    ? Icons.person_rounded
                    : Icons.person_outline_rounded,

                color: _currentNavIndex == 4
                    ? const Color(0xFF3B82F6)
                    : Colors.white60,

                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}