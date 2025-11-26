import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); // Use the default Firebase options for the current platform.
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyBtOzQt_4YJQOksIpVYFWrF3GTiB1e8uA0",
    authDomain: "attendance-app-project-92f92.firebaseapp.com",
    projectId: "attendance-app-project-92f92",
    storageBucket: "attendance-app-project-92f92.firebasestorage.app",
    messagingSenderId: "1097056844428",
    appId: "1:1097056844428:web:528094cdacb1a5705919a9",
    measurementId: "G-99000S7T6Q"));
    
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // Hides the debug banner in the top-right corner.
      title: "Attendance System",
      routerConfig: AppRouter.router,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
