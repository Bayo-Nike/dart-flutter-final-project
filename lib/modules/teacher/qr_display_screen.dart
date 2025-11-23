import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDisplayScreen extends StatelessWidget {
  final String sessionId;
  const QRDisplayScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Attendance")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("attendance_sessions")
            .doc(sessionId)
            .snapshots(),
        builder: (context, snap) {
          if (!snap.hasData) return const Center(child: CircularProgressIndicator());
          final docData = snap.data!.data() as Map<String, dynamic>;
          final token = docData['qrToken'] ?? "no-token";

          // final token = snap.data!["qrToken"] ?? "no-token";

          final qrData = "$sessionId|$token";

          return Center(
            child: QrImageView(
              data: qrData,
              size: 250,
            ),
          );
        },
      ),
    );
  }
}
