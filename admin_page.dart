// admin_page.dart

import 'package:flutter/material.dart';
import 'add_event.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Map<String, dynamic>> events = [];
  List<bool> selectedEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                var event = events[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedEvents[index] ? Colors.grey[300] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Event: ${event['eventName']}'),
                      subtitle: Text('Date: ${event['startDate']} to ${event['endDate']}, Slots: ${event['slots']}'),
                      trailing: Checkbox(
                        value: selectedEvents[index],
                        onChanged: (value) {
                          setState(() {
                            selectedEvents[index] = value!;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Navigate to AddEventPage and wait for the result
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddEventPage()),
                  );

                  // Check if the result is not null (i.e., user added an event)
                  if (result != null) {
                    // Update the events list with the new event
                    setState(() {
                      events.insert(0, result); // Insert at the beginning of the list
                      selectedEvents.insert(0, false); // Initialize selection state
                    });
                  }
                },
                child: Text('Add Event'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Delete selected events
                  setState(() {
                    for (int i = selectedEvents.length - 1; i >= 0; i--) {
                      if (selectedEvents[i]) {
                        events.removeAt(i);
                        selectedEvents.removeAt(i);
                      }
                    }
                  });
                },
                child: Text('Delete Event'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}