//reg.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
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
        title: Text('Registration Page'),
      ),
      body: Padding(
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: regIdController,
                      decoration: InputDecoration(
                        labelText: 'Registration ID',
                      ),
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedBranch,
                      hint: Text('Select Branch'),
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
                SizedBox(height: 16),
                Text(
                  'Interests',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Card(
                  child: CheckboxListTile(
                    title: Text('Dance'),
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
                  child: CheckboxListTile(
                    title: Text('Singing'),
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
                  child: CheckboxListTile(
                    title: Text('Seminar'),
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
                  child: CheckboxListTile(
                    title: Text('Essay Writing'),
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
                  child: CheckboxListTile(
                    title: Text('Art & Craft'),
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
                SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 16),
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
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
