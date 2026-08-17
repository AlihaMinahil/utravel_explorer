import 'package:flutter/material.dart';
import 'create_trip_screen.dart';
import 'trip_details_screen.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  final List<Map<String, dynamic>> trips = [
    {
      "name": "Trip to Murree",
      "destination": "Murree, Pakistan",
      "startDate": "20 Aug 2026",
      "endDate": "23 Aug 2026",
      "travelers": 3,
      "days": "4 Days",
      "date": "20 Aug - 23 Aug 2026",
      "image":
      "https://images.unsplash.com/photo-1500534623283-312aade485b7?auto=format&fit=crop&w=700&q=80",
    },
    {
      "name": "Trip to Hunza",
      "destination": "Hunza Valley, Pakistan",
      "startDate": "05 Sep 2026",
      "endDate": "10 Sep 2026",
      "travelers": 4,
      "days": "6 Days",
      "date": "05 Sep - 10 Sep 2026",
      "image":
      "https://images.unsplash.com/photo-1530789253388-582c481c54b0?auto=format&fit=crop&w=700&q=80",
    },
  ];

  Future<void> _createTrip() async {
    final result =
    await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) => const CreateTripScreen(),
      ),
    );

    if (!mounted || result == null) return;

    final start = result["startDateRaw"] as DateTime;
    final end = result["endDateRaw"] as DateTime;

    final days = end.difference(start).inDays + 1;

    setState(() {
      trips.insert(
        0,
        {
          ...result,
          "days": "$days Days",
          "date":
          "${result["startDate"]} - ${result["endDate"]}",
        },
      );
    });
  }

  void _openTrip(Map<String, dynamic> trip) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TripDetailsScreen(
          trip: trip,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),

      body: SafeArea(
        child: Column(
          children: [

            // HEADER
            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                18,
                20,
                12,
              ),

              child: Row(
                children: [

                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Color(0xFF10182F),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "My Trips",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF10182F),
                        ),
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.notifications_none_rounded,
                    size: 30,
                    color: Color(0xFF10182F),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  5,
                  20,
                  20,
                ),

                children: [

                  // CREATE TRIP
                  SizedBox(
                    height: 58,
                    width: double.infinity,

                    child: ElevatedButton.icon(
                      onPressed: _createTrip,

                      icon: const Icon(
                        Icons.add,
                        size: 27,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Create Trip",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),

                      style:
                      ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xFF0757E8),
                        elevation: 0,
                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    "Upcoming Trips",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF10182F),
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...trips.map(
                        (trip) => Padding(
                      padding:
                      const EdgeInsets.only(
                        bottom: 15,
                      ),

                      child: _tripCard(trip),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: 2,
        type:
        BottomNavigationBarType.fixed,

        selectedItemColor:
        const Color(0xFF0757E8),

        unselectedItemColor:
        const Color(0xFF697386),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business_center_rounded,
            ),
            label: "Trips",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_rounded,
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _tripCard(
      Map<String, dynamic> trip,
      ) {
    return GestureDetector(
      onTap: () => _openTrip(trip),

      child: Container(
        height: 190,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color:
              Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [

            ClipRRect(
              borderRadius:
              const BorderRadius.only(
                topLeft:
                Radius.circular(18),
                bottomLeft:
                Radius.circular(18),
              ),

              child: Image.network(
                trip["image"],
                width: 135,
                height: 190,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) {
                  return Container(
                    width: 135,
                    height: 190,
                    color:
                    const Color(0xFFE6F0FF),
                    child: const Icon(
                      Icons.landscape,
                      size: 45,
                      color:
                      Color(0xFF0757E8),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      trip["name"],
                      maxLines: 2,
                      overflow:
                      TextOverflow.ellipsis,

                      style:
                      const TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.w700,
                        color:
                        Color(0xFF10182F),
                      ),
                    ),

                    const SizedBox(height: 12),

                    _info(
                      Icons.location_on_rounded,
                      trip["destination"],
                    ),

                    const SizedBox(height: 10),

                    _info(
                      Icons.calendar_month_rounded,
                      trip["date"],
                    ),

                    const SizedBox(height: 10),

                    _info(
                      Icons.people_alt_rounded,
                      "${trip["travelers"]} Travelers",
                    ),

                    const Spacer(),

                    Align(
                      alignment:
                      Alignment.centerRight,

                      child: const Text(
                        "View Details →",
                        style: TextStyle(
                          color:
                          Color(0xFF0757E8),
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(
      IconData icon,
      String text,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFF0757E8),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow:
            TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF596579),
            ),
          ),
        ),
      ],
    );
  }
}