import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key});

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
        title: const Text('Admin Page'),
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
              Column(
                children: [
                  IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddEventPage()),
                      );

                      if (result != null) {
                        setState(() {
                          events.insert(0, result);
                          selectedEvents.insert(0, false);
                        });
                      }
                    },
                    icon: const Icon(Icons.add_box), // Change icon to add
                    tooltip: 'Add', // Add tooltip
                  ),
                  const Text('Add'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        for (int i = selectedEvents.length - 1; i >= 0; i--) {
                          if (selectedEvents[i]) {
                            events.removeAt(i);
                            selectedEvents.removeAt(i);
                          }
                        }
                      });
                    },
                    icon: const Icon(Icons.delete), // Change icon to delete
                    tooltip: 'Delete', // Add tooltip
                  ),
                  const Text('Delete'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddEventPage extends StatelessWidget {
  const AddEventPage({Key? key});

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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(), // Define the home route
        '/admin': (context) => const AdminPage(), // Define the admin route
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/admin'); // Navigate to the admin page
          },
          child: const Text('Go to Admin Page'),
        ),
      ),
    );
  }
}
