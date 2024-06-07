import 'package:flutter/material.dart';

class HideScreen extends StatefulWidget {
  const HideScreen({super.key});

  @override
  State<HideScreen> createState() => _HideScreenState();
}

class _HideScreenState extends State<HideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade300,
        title: const Text("Hide screen"),
      ),
      body: const Center(child: Text("Hide Screen Opened",
        style: TextStyle(
          fontSize: 25,
        ),
      ),),
    );
  }
}
