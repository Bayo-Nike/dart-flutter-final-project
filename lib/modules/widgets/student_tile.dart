import 'package:flutter/material.dart';
import '../attendance/student_model.dart';

class StudentTile extends StatelessWidget {
  final StudentModel student;
  final VoidCallback? onTap;

  const StudentTile({
    super.key,
    required this.student,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(student.name.substring(0, 1).toUpperCase()),
        ),
        title: Text(student.name),
        subtitle: Text("Class: ${student.classId}"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
