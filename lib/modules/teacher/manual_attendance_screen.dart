import 'package:flutter/material.dart';

class ManualAttendanceScreen extends StatelessWidget {
  final String sessionId;
  const ManualAttendanceScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manual Attendance")),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text("Student $i"),
            trailing: ElevatedButton(
              child: Text("Present"),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
