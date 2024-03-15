import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/admin': (context) => const AdminPage(),
        '/add_event': (context) => const AddEventPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/admin');
          },
          child: const Text('Go to Admin Page'),
        ),
      ),
    );
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

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
                  InkWell(
                    onTap: () async {
                      final result = await Navigator.pushNamed(context, '/add_event');
                      if (result != null) {
                        setState(() {
                          events.insert(0, result);
                          selectedEvents.insert(0, false);
                        });
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  const Text('Add', style: TextStyle(fontSize: 16)),
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
                    icon: const Icon(Icons.delete, color: Colors.red, size: 40),
                  ),
                  const Text('Delete', style: TextStyle(fontSize: 16)),
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
  const AddEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event Page'),
      ),
      body: const Center(
        child: Text('Add Event Page Content'),
      ),
    );
  }
}
