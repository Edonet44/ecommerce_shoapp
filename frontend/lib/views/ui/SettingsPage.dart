import 'package:flutter/material.dart';



class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Torna indietro alla pagina precedente
          },
          child: const Text('Back to Profile Page'),
        ),
      ),
    );
  }
}
