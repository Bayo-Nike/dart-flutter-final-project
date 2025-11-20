import 'package:attendance_app/modules/auth/register_screen.dart';
import 'package:attendance_app/modules/student/attendance_status_screen.dart';
import 'package:attendance_app/modules/student/qr_scan_screen.dart';
import 'package:attendance_app/modules/teacher/start_session_screen.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool loading = false;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(controller: email),

              const SizedBox(height: 20),
              const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(controller: password, obscureText: true),

              const SizedBox(height: 20),
              if (error.isNotEmpty)
                Text(error, style: const TextStyle(color: Colors.red)),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : login,
                  child: loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Login"),
                ),
              ),

              // TextButton(
              //   onPressed: () => Navigator.pushNamed(context, "/register"),
              //   child: const Text("Create new account"),
              // )
              
              // Sign Up
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    'Don’t have an account? Sign Up',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    setState(() {
      loading = true;
      error = "";
    });

    final result = await AuthService().login(
      email.text.trim(),
      password.text.trim(),
    );

    setState(() => loading = false);

    if (result.error != null) {
      setState(() => error = result.error!);
      return;
    }

    final user = result.user!;

    // Navigate based on role
    if (!mounted) return;
    switch (user.role) {
      case "teacher":
        Navigator.pushReplacementNamed(context, "/teacher/start");
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => StartSessionScreen(
        //     ),
        //   ),
        // );
        
        
        break;
      case "student":
        Navigator.pushReplacementNamed(context, "/student/home");
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => QRScanScreen(
        //     ),
        //   ),
        // );

        break;
      default:
        setState(() => error = "Unknown role: ${user.role}");
    }
  }
}
