import 'package:flutter/material.dart';

class AttendanceStatusScreen extends StatelessWidget {
  final bool success;
  final String message;
  final String method; // qr, manual, face

  const AttendanceStatusScreen({
    super.key,
    required this.success,
    required this.message,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance Status")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                success ? Icons.check_circle : Icons.cancel,
                color: success ? Colors.green : Colors.red,
                size: 120,
              ),
              const SizedBox(height: 20),
              Text(
                success ? "Attendance Recorded!" : "Failed",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: success ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text("Method: $method"),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
