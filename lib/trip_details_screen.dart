import 'package:flutter/material.dart';
import 'daily_itinerary_screen.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({
    super.key,
    required this.trip,
  });

  final Map<String, dynamic> trip;

  @override
  Widget build(BuildContext context) {
    final start =
    trip["startDateRaw"] as DateTime;

    final end =
    trip["endDateRaw"] as DateTime;

    final totalDays =
        end.difference(start).inDays + 1;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding:
              const EdgeInsets.all(15),

              child: Row(
                children: [

                  IconButton(
                    onPressed: () =>
                        Navigator.pop(context),

                    icon: const Icon(
                      Icons.arrow_back_rounded,
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Trip Details",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight:
                          FontWeight.w700,
                          color:
                          Color(0xFF10182F),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 48),
                ],
              ),
            ),

            Expanded(
              child:
              SingleChildScrollView(
                child: Column(
                  children: [

                    Image.network(
                      trip["image"],
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.all(
                        20,
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Text(
                            trip["name"],
                            style:
                            const TextStyle(
                              fontSize: 27,
                              fontWeight:
                              FontWeight.w700,
                              color:
                              Color(0xFF10182F),
                            ),
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          Row(
                            children: [

                              const Icon(
                                Icons
                                    .location_on_rounded,
                                color:
                                Color(
                                  0xFF0757E8,
                                ),
                              ),

                              const SizedBox(
                                width: 5,
                              ),

                              Text(
                                trip["destination"],
                                style:
                                const TextStyle(
                                  color:
                                  Color(
                                    0xFF596579,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 25,
                          ),

                          Container(
                            padding:
                            const EdgeInsets
                                .all(18),

                            decoration:
                            BoxDecoration(
                              color:
                              const Color(
                                0xFFF8FAFD,
                              ),

                              borderRadius:
                              BorderRadius
                                  .circular(
                                18,
                              ),
                            ),

                            child: Row(
                              children: [

                                Expanded(
                                  child: _stat(
                                    "Start",
                                    trip[
                                    "startDate"],
                                  ),
                                ),

                                Expanded(
                                  child: _stat(
                                    "End",
                                    trip[
                                    "endDate"],
                                  ),
                                ),

                                Expanded(
                                  child: _stat(
                                    "Travelers",
                                    "${trip["travelers"]}",
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Text(
                            "Total Days: $totalDays Days",
                            style:
                            const TextStyle(
                              fontSize: 18,
                              fontWeight:
                              FontWeight.w700,
                              color:
                              Color(
                                0xFF10182F,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 25,
                          ),

                          const Text(
                            "Trip Information",
                            style:
                            TextStyle(
                              fontSize: 20,
                              fontWeight:
                              FontWeight.w700,
                              color:
                              Color(
                                0xFF10182F,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          const Text(
                            "Plan your activities day by day and enjoy your journey.",
                            style:
                            TextStyle(
                              fontSize: 15,
                              color:
                              Color(
                                0xFF596579,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          SizedBox(
                            width:
                            double.infinity,
                            height: 58,

                            child:
                            ElevatedButton(
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        DailyItineraryScreen(
                                          trip: trip,
                                        ),
                                  ),
                                );

                              },

                              style:
                              ElevatedButton
                                  .styleFrom(
                                backgroundColor:
                                const Color(
                                  0xFF0757E8,
                                ),
                                elevation: 0,
                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                    15,
                                  ),
                                ),
                              ),

                              child:
                              const Text(
                                "View Itinerary",
                                style:
                                TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 17,
                                  fontWeight:
                                  FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
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

  Widget _stat(
      String title,
      String value,
      ) {
    return Column(
      children: [

        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF596579),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF10182F),
          ),
        ),
      ],
    );
  }
}