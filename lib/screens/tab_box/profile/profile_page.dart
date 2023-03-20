import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfiePage extends StatefulWidget {
  const ProfiePage({super.key});

  @override
  State<ProfiePage> createState() => _ProfiePageState();
}

class _ProfiePageState extends State<ProfiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Helllooo',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
