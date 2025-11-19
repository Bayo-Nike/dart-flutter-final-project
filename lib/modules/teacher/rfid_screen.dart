import 'package:flutter/material.dart';

class RFIDScreen extends StatelessWidget {
  final String sessionId;

  const RFIDScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RFID Attendance")),
      body: Center(
        child: Text("Connect RFID Reader → Read Tag → Mark Attendance"),
      ),
    );
  }
}
