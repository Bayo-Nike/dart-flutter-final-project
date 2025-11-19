import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceSession {
  final String id;
  final String teacherId;
  final String classId;
  final int startTime;
  final bool qrEnabled;
  final bool manualEnabled;
  final String? qrToken;     // Token updated every 10 seconds in Firebase
  final int? qrUpdatedAt;    // Timestamp when token last changed

  AttendanceSession({
    required this.id,
    required this.teacherId,
    required this.classId,
    required this.startTime,
    required this.qrEnabled,
    required this.manualEnabled,
    this.qrToken,
    this.qrUpdatedAt,
  });

  /// Convert Firestore doc → Model
  factory AttendanceSession.fromMap(String id, Map<String, dynamic> map) {
    return AttendanceSession(
      id: id,
      teacherId: map['teacherId'] ?? '',
      classId: map['classId'] ?? '',
      startTime: map['startTime'] ?? 0,
      qrEnabled: map['qrEnabled'] ?? false,
      manualEnabled: map['manualEnabled'] ?? false,
      qrToken: map['qrToken'],
      qrUpdatedAt: map['qrUpdatedAt'],
    );
  }

  /// Convert Model → Firestore map
  Map<String, dynamic> toMap() {
    return {
      'teacherId': teacherId,
      'classId': classId,
      'startTime': startTime,
      'qrEnabled': qrEnabled,
      'manualEnabled': manualEnabled,
      'qrToken': qrToken,
      'qrUpdatedAt': qrUpdatedAt,
    };
  }

  /// For updating values
  AttendanceSession copyWith({
    String? id,
    String? teacherId,
    String? classId,
    int? startTime,
    bool? qrEnabled,
    bool? manualEnabled,
    String? qrToken,
    int? qrUpdatedAt,
  }) {
    return AttendanceSession(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
      classId: classId ?? this.classId,
      startTime: startTime ?? this.startTime,
      qrEnabled: qrEnabled ?? this.qrEnabled,
      manualEnabled: manualEnabled ?? this.manualEnabled,
      qrToken: qrToken ?? this.qrToken,
      qrUpdatedAt: qrUpdatedAt ?? this.qrUpdatedAt,
    );
  }

  /// Convert Firestore snapshot → Model
  static AttendanceSession fromSnapshot(DocumentSnapshot doc) {
    return AttendanceSession.fromMap(doc.id, doc.data() as Map<String, dynamic>);
  }
}
