import 'package:flutter/material.dart';
import 'edit_activity_screen.dart';

class ActivityDetailsScreen
    extends StatelessWidget {

  const ActivityDetailsScreen({
    super.key,
    required this.activity,
  });

  final Map<String, dynamic> activity;

  Future<void> edit(
      BuildContext context,
      ) async {

    final result =
    await Navigator.push(
      context,

      MaterialPageRoute(
        builder: (_) =>
            EditActivityScreen(
              activity: activity,
            ),
      ),
    );

    if (result != null &&
        context.mounted) {

      Navigator.pop(
        context,
        result,
      );
    }
  }

  void delete(
      BuildContext context,
      ) {

    showDialog(
      context: context,

      builder: (_) =>
          AlertDialog(
            title: const Text(
              "Delete Activity?",
            ),

            content: const Text(
              "Are you sure you want to delete this activity?",
            ),

            actions: [

              TextButton(
                onPressed: () =>
                    Navigator.pop(context),

                child:
                const Text("Cancel"),
              ),

              TextButton(
                onPressed: () {

                  Navigator.pop(context);

                  Navigator.pop(
                    context,
                    "deleted",
                  );
                },

                child: const Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(
      BuildContext context,
      ) {

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
            color:
            Color(0xFF10182F),
          ),
        ),

        title: const Text(
          "Activity Details",
          style: TextStyle(
            color:
            Color(0xFF10182F),
            fontWeight:
            FontWeight.w700,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding:
        const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Container(
              width: double.infinity,

              padding:
              const EdgeInsets.all(20),

              decoration:
              BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(
                  20,
                ),
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Container(
                    width: 60,
                    height: 60,

                    decoration:
                    BoxDecoration(
                      color:
                      const Color(
                        0xFFEAF1FF,
                      ),

                      borderRadius:
                      BorderRadius.circular(
                        16,
                      ),
                    ),

                    child: const Icon(
                      Icons
                          .location_on_rounded,
                      color:
                      Color(0xFF0757E8),
                      size: 30,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    activity["title"],
                    style:
                    const TextStyle(
                      fontSize: 26,
                      fontWeight:
                      FontWeight.w700,
                      color:
                      Color(0xFF10182F),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  _row(
                    Icons.access_time_rounded,
                    "Time",
                    activity["time"],
                  ),

                  _row(
                    Icons.location_on_rounded,
                    "Location",
                    activity["location"],
                  ),

                  _row(
                    Icons.category_rounded,
                    "Category",
                    activity["category"],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    "Description",
                    style:
                    TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.w700,
                      color:
                      Color(0xFF10182F),
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    activity["description"]
                        ?.toString()
                        .isEmpty ==
                        true
                        ? "No description"
                        : activity[
                    "description"],
                    style:
                    const TextStyle(
                      fontSize: 15,
                      color:
                      Color(0xFF596579),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            SizedBox(
              width: double.infinity,
              height: 56,

              child: ElevatedButton.icon(
                onPressed: () =>
                    edit(context),

                icon: const Icon(
                  Icons.edit_rounded,
                  color: Colors.white,
                ),

                label: const Text(
                  "Edit Activity",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(
                    0xFF0757E8,
                  ),
                  elevation: 0,
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                      15,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            SizedBox(
              width: double.infinity,
              height: 56,

              child: OutlinedButton.icon(
                onPressed: () =>
                    delete(context),

                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.red,
                ),

                label: const Text(
                  "Delete Activity",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                style:
                OutlinedButton.styleFrom(
                  side:
                  const BorderSide(
                    color: Colors.red,
                  ),

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                      15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(
      IconData icon,
      String title,
      String value,
      ) {

    return Padding(
      padding:
      const EdgeInsets.only(
        bottom: 17,
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color:
            const Color(
              0xFF0757E8,
            ),
          ),

          const SizedBox(
            width: 12,
          ),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style:
                const TextStyle(
                  fontSize: 12,
                  color:
                  Color(
                    0xFF596579,
                  ),
                ),
              ),

              Text(
                value,
                style:
                const TextStyle(
                  fontSize: 15,
                  fontWeight:
                  FontWeight.w600,
                  color:
                  Color(
                    0xFF10182F,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}