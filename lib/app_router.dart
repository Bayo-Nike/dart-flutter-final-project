import 'package:attendance_app/modules/student/attendance_status_screen.dart';
import 'package:attendance_app/modules/teacher/face_camera_screen.dart';
import 'package:attendance_app/modules/teacher/manual_attendance_screen.dart';
import 'package:attendance_app/modules/teacher/qr_display_screen.dart';
import 'modules/auth/login_screen.dart';
import 'package:attendance_app/modules/student/qr_scan_screen.dart';
import 'package:attendance_app/modules/teacher/start_session_screen.dart';

// class AppRouter {
//   static final router = RouterConfig(
//     routes: {
//       '/': (context) => const LoginScreen(),
//       '/teacher/start': (context) => const StartSessionScreen(),
//       '/student/scan': (context) => const QRScanScreen(),
//     },
//   );
// }

import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),

      // Teacher Route
      GoRoute(
        path: '/teacher/start',
        builder: (context, state) => const StartSessionScreen(),
      ),
      GoRoute(
        path: '/teacher/face',
        builder: (context, state) => const FaceCameraScreen(),
      ),
      // GoRouter setup
      GoRoute(
        path: '/teacher/qr',
        builder: (context, state) {
          final sessionId = state.extra as String;
          return QRDisplayScreen(sessionId: sessionId);
        },
      ),

      GoRoute(
        path: '/teacher/manual',
        builder: (context, state) {
          final sessionId = state.extra as String;
          return ManualAttendanceScreen(sessionId: sessionId);
        },
      ),

      GoRoute(
        path: '/attendance/status',
        builder: (context, state) {
          final args = state.extra as Map?;

          return AttendanceStatusScreen(
            success: args?['success'],
            method: args?['method'],
            message: args?['message'],
          );
        },
      ),



      // Student Route
      GoRoute(
        path: '/student/home',
        builder: (context, state) => const QRScanScreen(),
      ),
      GoRoute(
        path: '/student/scan',
        builder: (context, state) => const QRScanScreen(),
      ),
      
    ],
  );
}

