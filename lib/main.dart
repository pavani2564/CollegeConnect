//main.dart
import 'package:flutter/material.dart';
import 'admin_login.dart';
import 'events.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Forms',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLoginForm(
              context,
              "Admin Login",
              Colors.grey[300]!,
              Icons.admin_panel_settings,
                  () => _loginAdmin(context),
            ),
            const SizedBox(height: 32),
            _buildLoginForm(
              context,
              "User Login",
              Colors.grey[300]!,
              Icons.person,
                  () => _loginUser(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm(
      BuildContext context,
      String title,
      Color backgroundColor,
      IconData icon,
      VoidCallback onLogin,
      ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: Icon(icon, color: Colors.grey[700]),
            title: Text(title, style: TextStyle(color: Colors.grey[800])),
          ),
          const NeumorphicTextField(
            labelText: 'ID',
          ),
          const SizedBox(height: 8),
          const NeumorphicTextField(
            labelText: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 16),
          NeumorphicButton(
            onPressed: onLogin,
            backgroundColor: backgroundColor,
            child: Text('Login', style: TextStyle(color: Colors.grey[800])),
          ),
        ],
      ),
    );
  }

  void _loginAdmin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLoginPage()));
  }

  void _loginUser(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
  }
}

class NeumorphicTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;

  const NeumorphicTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[300],
      ),
      obscureText: obscureText,
      style: TextStyle(color: Colors.grey[800]),
    );
  }
}

class NeumorphicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;

  const NeumorphicButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.grey[800],
        shadowColor: Colors.grey[500],
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
      child: child,
    );
  }
}
