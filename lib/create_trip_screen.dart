import 'package:flutter/material.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() =>
      _CreateTripScreenState();
}

class _CreateTripScreenState
    extends State<CreateTripScreen> {

  final tripNameController =
  TextEditingController();

  final destinationController =
  TextEditingController();

  DateTime startDate =
  DateTime.now();

  DateTime endDate =
  DateTime.now().add(
    const Duration(days: 3),
  );

  int travelers = 1;

  final primaryBlue =
  const Color(0xFF0757E8);

  final darkText =
  const Color(0xFF10182F);

  @override
  void dispose() {
    tripNameController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    return "${date.day} "
        "${months[date.month - 1]} "
        "${date.year}";
  }

  Future<void> pickDate(
      bool isStart,
      ) async {
    final picked =
    await showDatePicker(
      context: context,
      initialDate:
      isStart ? startDate : endDate,
      firstDate: DateTime.now(),
      lastDate:
      DateTime(2035),
    );

    if (picked == null) return;

    setState(() {
      if (isStart) {
        startDate = picked;

        if (endDate.isBefore(startDate)) {
          endDate = startDate;
        }
      } else {
        endDate = picked;
      }
    });
  }

  void createTrip() {
    if (tripNameController.text
        .trim()
        .isEmpty ||
        destinationController.text
            .trim()
            .isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content:
          Text("Please fill all fields"),
        ),
      );
      return;
    }

    final trip = {
      "name":
      tripNameController.text.trim(),

      "destination":
      destinationController.text.trim(),

      "startDate":
      formatDate(startDate),

      "endDate":
      formatDate(endDate),

      "startDateRaw":
      startDate,

      "endDateRaw":
      endDate,

      "travelers":
      travelers,

      "image":
      "https://images.unsplash.com/photo-1500534623283-312aade485b7?auto=format&fit=crop&w=1200&q=90",
    };

    Navigator.pop(
      context,
      trip,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding:
              const EdgeInsets.all(20),

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
                        "Create New Trip",
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
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    _label("Trip Name"),

                    _field(
                      tripNameController,
                      "Enter trip name",
                      Icons.card_travel,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    _label("Destination"),

                    _field(
                      destinationController,
                      "Enter destination",
                      Icons.location_on_rounded,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    _label("Start Date"),

                    _dateBox(
                      formatDate(startDate),
                          () => pickDate(true),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    _label("End Date"),

                    _dateBox(
                      formatDate(endDate),
                          () => pickDate(false),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    _label(
                      "Number of Travelers",
                    ),

                    Container(
                      height: 58,
                      decoration:
                      BoxDecoration(
                        border: Border.all(
                          color:
                          const Color(
                            0xFFDCE2EC,
                          ),
                        ),
                        borderRadius:
                        BorderRadius.circular(
                          15,
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                        children: [

                          IconButton(
                            onPressed: () {
                              if (travelers > 1) {
                                setState(
                                      () =>
                                  travelers--,
                                );
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),

                          Text(
                            "$travelers",
                            style:
                            const TextStyle(
                              fontSize: 18,
                              fontWeight:
                              FontWeight.w700,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              setState(
                                    () =>
                                travelers++,
                              );
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 58,

                      child: ElevatedButton(
                        onPressed: createTrip,

                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          primaryBlue,
                          elevation: 0,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                              15,
                            ),
                          ),
                        ),

                        child: const Text(
                          "Create Trip",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight:
                            FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
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

  Widget _label(String text) {
    return Padding(
      padding:
      const EdgeInsets.only(bottom: 8),

      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF10182F),
        ),
      ),
    );
  }

  Widget _field(
      TextEditingController controller,
      String hint,
      IconData icon,
      ) {
    return Container(
      height: 58,

      decoration: BoxDecoration(
        border: Border.all(
          color:
          const Color(0xFFDCE2EC),
        ),
        borderRadius:
        BorderRadius.circular(15),
      ),

      child: TextField(
        controller: controller,

        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIcon: Icon(
            icon,
            color: primaryBlue,
          ),

          hintText: hint,
        ),
      ),
    );
  }

  Widget _dateBox(
      String value,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 58,

        padding:
        const EdgeInsets.symmetric(
          horizontal: 15,
        ),

        decoration:
        BoxDecoration(
          border: Border.all(
            color:
            const Color(0xFFDCE2EC),
          ),
          borderRadius:
          BorderRadius.circular(15),
        ),

        child: Row(
          children: [

            const Icon(
              Icons.calendar_month_rounded,
              color: Color(0xFF0757E8),
            ),

            const SizedBox(width: 12),

            Text(
              value,
              style:
              const TextStyle(
                fontSize: 16,
                color:
                Color(0xFF10182F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}