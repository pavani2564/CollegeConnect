// add_event.dart

import 'package:flutter/material.dart';

class AddEventPage extends StatelessWidget {
  const AddEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController eventNameController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();
    TextEditingController slotsController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: eventNameController,
              decoration: const InputDecoration(labelText: 'Event Name'),
            ),
            TextField(
              controller: startDateController,
              decoration: const InputDecoration(labelText: 'Start Date'),
            ),
            TextField(
              controller: endDateController,
              decoration: const InputDecoration(labelText: 'End Date'),
            ),
            TextField(
              controller: slotsController,
              decoration: const InputDecoration(labelText: 'Number of Slots'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add event logic
                String eventName = eventNameController.text;
                String startDate = startDateController.text;
                String endDate = endDateController.text;
                int slots = int.tryParse(slotsController.text) ?? 0;

                // Validate input fields (add your validation logic)

                // Create an event object with the entered details
                Map<String, dynamic> event = {
                  'eventName': eventName,
                  'startDate': startDate,
                  'endDate': endDate,
                  'slots': slots,
                };

                // Pass the event back to the previous screen (AdminPage)
                Navigator.pop(context, event);
              },
              child: const Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
