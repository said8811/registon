import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StudentUpdateProfielScreen extends StatefulWidget {
  const StudentUpdateProfielScreen({super.key});

  @override
  State<StudentUpdateProfielScreen> createState() =>
      _StudentUpdateProfielScreenState();
}

class _StudentUpdateProfielScreenState
    extends State<StudentUpdateProfielScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('This is supposed to be Update Profile Screen'),
      ),
    );
  }
}
