import 'package:flutter/material.dart';
import '../widgets/loading_indicator.dart';
import 'package:go_router/go_router.dart';

class FaceCameraScreen extends StatefulWidget {
  const FaceCameraScreen({super.key});

  @override
  State<FaceCameraScreen> createState() => _FaceCameraScreenState();
}

class _FaceCameraScreenState extends State<FaceCameraScreen> {
  bool scanning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Face Recognition")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Camera Preview Here",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              scanning
                  ? const LoadingIndicator()
                  : ElevatedButton(
                      onPressed: startScan,
                      child: const Text("Scan Face"),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> startScan() async {
    setState(() => scanning = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    context.go(
      '/attendance/status',
      extra: {
        "success": true,
        "method": "face",
        "message": "Face detected successfully!",
      },
    );

  }
}
