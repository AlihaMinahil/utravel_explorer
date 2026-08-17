import 'package:flutter/material.dart';

class EditActivityScreen
    extends StatefulWidget {

  const EditActivityScreen({
    super.key,
    required this.activity,
  });

  final Map<String, dynamic> activity;

  @override
  State<EditActivityScreen> createState() =>
      _EditActivityScreenState();
}

class _EditActivityScreenState
    extends State<EditActivityScreen> {

  late TextEditingController
  nameController;

  late TextEditingController
  locationController;

  late TextEditingController
  descriptionController;

  late String category;

  TimeOfDay selectedTime =
  const TimeOfDay(
    hour: 15,
    minute: 0,
  );

  final categories = [
    "Sightseeing",
    "Shopping",
    "Food",
    "Adventure",
    "Hotel",
    "Transport",
    "Entertainment",
    "Other",
  ];

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(
          text: widget.activity["title"],
        );

    locationController =
        TextEditingController(
          text: widget.activity["location"],
        );

    descriptionController =
        TextEditingController(
          text:
          widget.activity["description"],
        );

    category =
        widget.activity["category"] ??
            "Sightseeing";
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> pickTime() async {
    final result =
    await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (result != null) {
      setState(() {
        selectedTime = result;
      });
    }
  }

  String get timeText {
    final hour =
    selectedTime.hourOfPeriod == 0
        ? 12
        : selectedTime.hourOfPeriod;

    final minute =
    selectedTime.minute
        .toString()
        .padLeft(2, "0");

    final period =
    selectedTime.period ==
        DayPeriod.am
        ? "AM"
        : "PM";

    return "$hour:$minute $period";
  }

  void updateActivity() {

    if (nameController.text
        .trim()
        .isEmpty) {
      return;
    }

    Navigator.pop(
      context,
      {
        "title":
        nameController.text.trim(),

        "time":
        timeText,

        "location":
        locationController.text.trim(),

        "category":
        category,

        "description":
        descriptionController.text.trim(),
      },
    );
  }

  @override
  Widget build(
      BuildContext context,
      ) {

    return Scaffold(
      backgroundColor: Colors.white,

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
          "Edit Activity",
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

            _label("Activity Name"),

            _field(
              nameController,
              Icons.edit_rounded,
            ),

            const SizedBox(
              height: 20,
            ),

            _label("Time"),

            GestureDetector(
              onTap: pickTime,

              child: _box(
                Row(
                  children: [

                    const Icon(
                      Icons.access_time_rounded,
                      color:
                      Color(0xFF0757E8),
                    ),

                    const SizedBox(
                      width: 12,
                    ),

                    Text(timeText),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            _label("Location"),

            _field(
              locationController,
              Icons.location_on_rounded,
            ),

            const SizedBox(
              height: 20,
            ),

            _label("Category"),

            Container(
              height: 58,

              padding:
              const EdgeInsets.symmetric(
                horizontal: 15,
              ),

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

              child:
              DropdownButtonHideUnderline(
                child:
                DropdownButton<String>(
                  value: categories
                      .contains(category)
                      ? category
                      : categories.first,

                  isExpanded: true,

                  items: categories
                      .map(
                        (item) =>
                        DropdownMenuItem(
                          value: item,
                          child:
                          Text(item),
                        ),
                  )
                      .toList(),

                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        category =
                            value;
                      });
                    }
                  },
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            _label("Description"),

            Container(
              height: 130,

              padding:
              const EdgeInsets.all(
                15,
              ),

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

              child: TextField(
                controller:
                descriptionController,

                maxLines: 5,

                decoration:
                const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            SizedBox(
              width: double.infinity,
              height: 58,

              child: ElevatedButton.icon(
                onPressed:
                updateActivity,

                icon: const Icon(
                  Icons.edit_rounded,
                  color: Colors.white,
                ),

                label: const Text(
                  "Update Activity",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding:
      const EdgeInsets.only(
        bottom: 8,
      ),

      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight:
          FontWeight.w700,
          color:
          Color(0xFF10182F),
        ),
      ),
    );
  }

  Widget _field(
      TextEditingController controller,
      IconData icon,
      ) {
    return Container(
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

      child: TextField(
        controller: controller,

        decoration:
        InputDecoration(
          border: InputBorder.none,

          prefixIcon: Icon(
            icon,
            color:
            const Color(
              0xFF0757E8,
            ),
          ),
        ),
      ),
    );
  }

  Widget _box(Widget child) {
    return Container(
      width: double.infinity,
      height: 58,

      padding:
      const EdgeInsets.symmetric(
        horizontal: 15,
      ),

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

      child: child,
    );
  }
}