//reg.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController regIdController = TextEditingController();
  String? selectedBranch;
  List<String> selectedInterests = [];
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: regIdController,
                        decoration: const InputDecoration(
                          labelText: 'Registration ID',
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        value: selectedBranch,
                        hint: const Text('Select Branch'),
                        onChanged: (value) {
                          setState(() {
                            selectedBranch = value;
                          });
                        },
                        items: [
                          'CSE',
                          'AIM',
                          'CAI',
                          'EEE',
                          'ECE',
                          'ME',
                          'CE',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Interests',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Changed interests color to black
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: CheckboxListTile(
                      title: const Text('Dance'),
                      value: selectedInterests.contains('Dance'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            selectedInterests.add('Dance');
                          } else {
                            selectedInterests.remove('Dance');
                          }
                        });
                      },
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: CheckboxListTile(
                      title: const Text('Singing'),
                      value: selectedInterests.contains('Singing'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            selectedInterests.add('Singing');
                          } else {
                            selectedInterests.remove('Singing');
                          }
                        });
                      },
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: CheckboxListTile(
                      title: const Text('Seminar'),
                      value: selectedInterests.contains('Seminar'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            selectedInterests.add('Seminar');
                          } else {
                            selectedInterests.remove('Seminar');
                          }
                        });
                      },
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: CheckboxListTile(
                      title: const Text('Essay Writing'),
                      value: selectedInterests.contains('SI Writing'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            selectedInterests.add('SI Writing');
                          } else {
                            selectedInterests.remove('SI Writing');
                          }
                        });
                      },
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: CheckboxListTile(
                      title: const Text('Art & Craft'),
                      value: selectedInterests.contains('Art & Craft'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            selectedInterests.add('Art & Craft');
                          } else {
                            selectedInterests.remove('Art & Craft');
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text;
                      String regId = regIdController.text;
                      String branch = selectedBranch ?? '';
                      String email = emailController.text;
                      print('Name: $name');
                      print('Registration ID: $regId');
                      print('Branch: $branch');
                      print('Interests: $selectedInterests');
                      print('Email: $email');
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
