import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';


class AttendanceService {
  final _db = FirebaseFirestore.instance;

  Future<String> startSession({required bool qr, required bool face, required bool rfid, required bool manual}) async {
    final doc = await _db.collection('attendance_sessions').add({
      'qrEnabled': qr,
      'faceEnabled': face,
      'rfidEnabled': rfid,
      'manualEnabled': manual,
      'startTime': DateTime.now().millisecondsSinceEpoch
    });

    return doc.id;
  }

  Future<void> registerAttendance({required String sessionId, required String method, String? token, required String studentId}) async {
    final callable = FirebaseFunctions.instance.httpsCallable("validateAttendance");
    await callable({
      "sessionId": sessionId,
      "method": method,
      "token": token,
      "studentId": "student001"
    });
  }
}
