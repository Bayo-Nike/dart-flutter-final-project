import 'package:flutter/material.dart';
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
      GoRoute(
        path: '/teacher/start',
        builder: (context, state) => const StartSessionScreen(),
      ),
      GoRoute(
        path: '/student/scan',
        builder: (context, state) => const QRScanScreen(),
      ),
    ],
  );
}

