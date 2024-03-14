//events.dart
import 'package:flutter/material.dart';
import 'reg.dart';

class Event {
  final String name;
  final String date;
  final String venue;
  final String imagePath;

  const Event({
    required this.name,
    required this.date,
    required this.venue,
    required this.imagePath,
  });
}

class EventsPage extends StatelessWidget {
  final List<Event> events = [
    const Event(
      name: 'Annual Science Fair',
      date: 'March 15, 2024',
      venue: 'Auditorium',
      imagePath: 'assets/images/science_fair.jpg',
    ),
    const Event(
      name: 'Football Championship',
      date: 'March 20, 2024',
      venue: 'Outdoor Stadium',
      imagePath: 'assets/images/football_championship.jpg',
    ),
    const Event(
      name: 'Dance Competition',
      date: 'April 5, 2024',
      venue: 'Dance Hall',
      imagePath: 'assets/images/dance_competition.jpg',
    ),
    const Event(
      name: 'Singing Contest',
      date: 'April 10, 2024',
      venue: 'Auditorium',
      imagePath: 'assets/images/singing_contest.jpg',
    ),
    const Event(
      name: 'Art Exhibition',
      date: 'April 20, 2024',
      venue: 'Art Gallery',
      imagePath: 'assets/images/art_exhibition.jpg',
    ),
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                elevation: 4.0,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(events[index].imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              events[index].name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Date: ${events[index].date}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Venue: ${events[index].venue}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                child: const Text(
                  'Register Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EventsPage(),
  ));
}
