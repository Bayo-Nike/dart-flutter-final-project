import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String? text;
  final double size;

  const LoadingIndicator({super.key, this.text, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size,
          height: size,
          child: const CircularProgressIndicator(),
        ),
        if (text != null) ...[
          const SizedBox(height: 10),
          Text(text!, style: const TextStyle(fontSize: 16)),
        ]
      ],
    );
  }
}
