import 'package:flutter/material.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceCheckInScreen extends StatefulWidget {
  final String sessionId;
  const FaceCheckInScreen({super.key, required this.sessionId});

  @override
  State<FaceCheckInScreen> createState() => _FaceCheckInScreenState();
}

class _FaceCheckInScreenState extends State<FaceCheckInScreen> {
  // Camera + ML code (simplified)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Face Recognition")),
      body: Center(child: Text("Camera feed and face matching logic")),
    );
  }
}
