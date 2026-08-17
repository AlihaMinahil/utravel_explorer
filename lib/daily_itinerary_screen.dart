import 'package:flutter/material.dart';
import 'activity_details_screen.dart';
import 'add_activity_screen.dart';

class DailyItineraryScreen extends StatefulWidget {
  const DailyItineraryScreen({
    super.key,
    required this.trip,
  });

  final Map<String, dynamic> trip;

  @override
  State<DailyItineraryScreen> createState() =>
      _DailyItineraryScreenState();
}

class _DailyItineraryScreenState
    extends State<DailyItineraryScreen> {

  int selectedDay = 1;

  final Map<int, List<Map<String, dynamic>>>
  activities = {
    1: [
      {
        "title": "Departure",
        "time": "09:00 AM",
        "location": "Sahiwal",
        "category": "Transport",
        "description":
        "Start journey towards Murree.",
      },
      {
        "title": "Mall Road",
        "time": "03:00 PM",
        "location":
        "Mall Road, Murree",
        "category": "Sightseeing",
        "description":
        "Explore Mall Road and enjoy shopping.",
      },
    ],
    2: [],
    3: [],
    4: [],
  };

  Future<void> addActivity() async {
    final result =
    await Navigator.push<
        Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const AddActivityScreen(),
      ),
    );

    if (!mounted || result == null) {
      return;
    }

    setState(() {
      activities[selectedDay]!.add(result);
    });
  }

  Future<void> openActivity(
      Map<String, dynamic> activity,
      int index,
      ) async {

    final result =
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ActivityDetailsScreen(
              activity: activity,
            ),
      ),
    );

    if (!mounted) return;

    if (result == "deleted") {
      setState(() {
        activities[selectedDay]!
            .removeAt(index);
      });
    }

    if (result is Map<String, dynamic>) {
      setState(() {
        activities[selectedDay]![index] =
            result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dayActivities =
        activities[selectedDay] ?? [];

    return Scaffold(
      backgroundColor:
      const Color(0xFFF8F9FC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () =>
              Navigator.pop(context),

          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF10182F),
          ),
        ),

        title: const Text(
          "Daily Itinerary",
          style: TextStyle(
            color: Color(0xFF10182F),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: Column(
        children: [

          // TRIP NAME
          Container(
            width: double.infinity,
            color: Colors.white,

            padding:
            const EdgeInsets.fromLTRB(
              20,
              5,
              20,
              18,
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  widget.trip["name"],
                  style:
                  const TextStyle(
                    fontSize: 20,
                    fontWeight:
                    FontWeight.w700,
                    color:
                    Color(0xFF10182F),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  widget.trip["destination"],
                  style:
                  const TextStyle(
                    color:
                    Color(0xFF596579),
                  ),
                ),
              ],
            ),
          ),

          // DAYS
          SizedBox(
            height: 80,

            child: ListView.builder(
              scrollDirection:
              Axis.horizontal,

              padding:
              const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),

              itemCount: 4,

              itemBuilder:
                  (context, index) {

                final day = index + 1;

                final selected =
                    selectedDay == day;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDay = day;
                    });
                  },

                  child: Container(
                    width: 75,

                    margin:
                    const EdgeInsets.only(
                      right: 10,
                    ),

                    decoration:
                    BoxDecoration(
                      color: selected
                          ? const Color(
                          0xFF0757E8)
                          : Colors.white,

                      borderRadius:
                      BorderRadius.circular(
                        15,
                      ),

                      border: Border.all(
                        color: selected
                            ? const Color(
                            0xFF0757E8)
                            : const Color(
                            0xFFDCE2EC),
                      ),
                    ),

                    child: Center(
                      child: Text(
                        "Day $day",
                        style:
                        TextStyle(
                          color: selected
                              ? Colors.white
                              : const Color(
                              0xFF10182F),
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: dayActivities.isEmpty
                ? const Center(
              child: Text(
                "No activities yet",
                style: TextStyle(
                  color:
                  Color(0xFF596579),
                  fontSize: 16,
                ),
              ),
            )
                : ListView.builder(
              padding:
              const EdgeInsets.all(
                20,
              ),

              itemCount:
              dayActivities.length,

              itemBuilder:
                  (context, index) {

                final activity =
                dayActivities[index];

                return GestureDetector(
                  onTap: () =>
                      openActivity(
                        activity,
                        index,
                      ),

                  child: Container(
                    margin:
                    const EdgeInsets
                        .only(
                      bottom: 15,
                    ),

                    padding:
                    const EdgeInsets
                        .all(16),

                    decoration:
                    BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                      BorderRadius
                          .circular(
                        18,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors
                              .black
                              .withOpacity(
                            0.05,
                          ),
                          blurRadius: 10,
                        ),
                      ],
                    ),

                    child: Row(
                      children: [

                        Container(
                          width: 52,
                          height: 52,

                          decoration:
                          BoxDecoration(
                            color:
                            const Color(
                              0xFFEAF1FF,
                            ),
                            borderRadius:
                            BorderRadius
                                .circular(
                              14,
                            ),
                          ),

                          child:
                          const Icon(
                            Icons
                                .location_on_rounded,
                            color:
                            Color(
                              0xFF0757E8,
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 14,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: [

                              Text(
                                activity[
                                "time"],
                                style:
                                const TextStyle(
                                  color:
                                  Color(
                                    0xFF0757E8,
                                  ),
                                  fontWeight:
                                  FontWeight
                                      .w700,
                                ),
                              ),

                              const SizedBox(
                                height: 4,
                              ),

                              Text(
                                activity[
                                "title"],
                                style:
                                const TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                  FontWeight
                                      .w700,
                                  color:
                                  Color(
                                    0xFF10182F,
                                  ),
                                ),
                              ),

                              Text(
                                activity[
                                "location"],
                                maxLines: 1,
                                overflow:
                                TextOverflow
                                    .ellipsis,
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
                        ),

                        const Icon(
                          Icons
                              .arrow_forward_ios_rounded,
                          size: 17,
                          color:
                          Color(
                            0xFF596579,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: addActivity,

        backgroundColor:
        const Color(0xFF0757E8),

        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        label: const Text(
          "Add Activity",
          style: TextStyle(
            color: Colors.white,
            fontWeight:
            FontWeight.w700,
          ),
        ),
      ),
    );
  }
}