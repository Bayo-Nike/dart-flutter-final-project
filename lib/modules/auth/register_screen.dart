import 'package:attendance_app/modules/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  String role = "student";
  bool loading = false;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Full Name"),
              TextField(controller: name),

              const SizedBox(height: 20),
              const Text("Email"),
              TextField(controller: email),

              const SizedBox(height: 20),
              const Text("Password"),
              TextField(controller: password, obscureText: true),

              const SizedBox(height: 20),
              const Text("Select Role"),
              DropdownButton<String>(
                value: role,
                items: const [
                  DropdownMenuItem(value: "student", child: Text("Student")),
                  DropdownMenuItem(value: "teacher", child: Text("Teacher")),
                ],
                onChanged: (v) {
                  setState(() => role = v!);
                },
              ),

              const SizedBox(height: 20),
              if (error.isNotEmpty)
                Text(error, style: const TextStyle(color: Colors.red)),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : register,
                  child: loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Register"),
                ),
              ),
              const SizedBox(height: 15),

                // Already have an account? Login
                TextButton(
                  onPressed: () {
                   Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                  },
                  child: const Text(
                    'Already have an account? Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    setState(() {
      loading = true;
      error = "";
    });

    final result = await AuthService().register(
      name: name.text.trim(),
      email: email.text.trim(),
      password: password.text.trim(),
      role: role,
    );

    setState(() => loading = false);

    if (result.error != null) {
      setState(() => error = result.error!);
      return;
    }

    // Navigate after registration
    if (!mounted) return;

    Navigator.pushReplacementNamed(context, "/");
  }
}
