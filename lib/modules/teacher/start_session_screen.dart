import 'package:attendance_app/modules/attendance/attendance_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartSessionScreen extends StatefulWidget {
  const StartSessionScreen({super.key});

  @override
  State<StartSessionScreen> createState() => _StartSessionScreenState();
}

class _StartSessionScreenState extends State<StartSessionScreen> {
  bool qr = true;
  bool face = true;
  bool rfid = true;
  bool manual = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Start Attendance Session")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(title: Text("QR Code"), value: qr, onChanged: (v) => setState(() => qr = v)),
            SwitchListTile(title: Text("Face Recognition"), value: face, onChanged: (v) => setState(() => face = v)),
            SwitchListTile(title: Text("RFID Card"), value: rfid, onChanged: (v) => setState(() => rfid = v)),
            SwitchListTile(title: Text("Manual"), value: manual, onChanged: (v) => setState(() => manual = v)),

            ElevatedButton(
              onPressed: () async {
                final sessionId = await AttendanceService().startSession(
                  qr: qr, face: face, rfid: rfid, manual: manual
                );
                print("SESSION CREATED: $sessionId");
              },
              child: Text("Start Session"),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                // Navigate from current page to /teacher/face
                context.push('/teacher/face');
              },
              child: const Text("Go to Face Scan"),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate from current page to /teacher/QR
                context.push('/teacher/qr');
              },
              child: const Text("Go to QR Scan"),
            ),
          ],
        ),
      ),
    );
  }
}
