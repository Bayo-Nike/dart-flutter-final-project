class StudentModel {
  final String id;
  final String name;
  final String email;
  final String classId;        // e.g., "10A" or "Grade 12"
  final String? rollNumber;    // Optional
  final String? rfidTag;       // Optional, used if RFID attendance is added
  final String? faceVectorUrl; // Optional, used for face recognition later

  StudentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.classId,
    this.rollNumber,
    this.rfidTag,
    this.faceVectorUrl,
  });

  /// Convert Firestore map → Model
  factory StudentModel.fromMap(String id, Map<String, dynamic> map) {
    return StudentModel(
      id: id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      classId: map['classId'] ?? '',
      rollNumber: map['rollNumber'],
      rfidTag: map['rfidTag'],
      faceVectorUrl: map['faceVectorUrl'],
    );
  }

  /// Convert Model → Firestore map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'classId': classId,
      'rollNumber': rollNumber,
      'rfidTag': rfidTag,
      'faceVectorUrl': faceVectorUrl,
    };
  }

  /// Update fields
  StudentModel copyWith({
    String? id,
    String? name,
    String? email,
    String? classId,
    String? rollNumber,
    String? rfidTag,
    String? faceVectorUrl,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      classId: classId ?? this.classId,
      rollNumber: rollNumber ?? this.rollNumber,
      rfidTag: rfidTag ?? this.rfidTag,
      faceVectorUrl: faceVectorUrl ?? this.faceVectorUrl,
    );
  }
}
