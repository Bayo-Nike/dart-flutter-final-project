import 'package:attendance_app/modules/attendance/attendance_service.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  bool scanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Attendance QR")),
      body: MobileScanner(
        onDetect: (capture) async {
          if (scanned) return;
          scanned = true;

          final barcode = capture.barcodes.first.rawValue;
          if (barcode == null) return;

          final parts = barcode.split("|");
          final sessionId = parts[0];
          final token = parts[1];

          await AttendanceService().registerAttendance(
            sessionId: sessionId,
            method: "qr",
            token: token,
            studentId: "student001",
          );

          if (mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Attendance recorded!")));
          }
        },
      ),
    );
  }
}
