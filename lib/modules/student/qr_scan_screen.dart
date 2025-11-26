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

          final barcodes = capture.barcodes;
          if (barcodes.isEmpty) return; // <-- Prevent crash

          scanned = true;

          final barcode = barcodes.first.rawValue;
          if (barcode == null) return;

          final parts = barcode.split("|");
          if (parts.length < 2) {
            debugPrint("Invalid QR format");
            return;
          }

          final sessionId = parts[0];
          final token = parts[1];

          try {
            await AttendanceService().registerAttendance(
              sessionId: sessionId,
              method: "qr",
              token: token,
              studentId: "student001",
            );

            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Attendance recorded!")),
              );
            }
          } catch (e) {
            scanned = false; // allow retry
            debugPrint("Error: $e");
          }
        }

      ),
    );
  }
}
