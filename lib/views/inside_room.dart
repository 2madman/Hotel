import 'package:flutter/material.dart';
import '../widget/linked_check.dart';

class InsideRoom extends StatefulWidget {
  const InsideRoom({super.key});

  @override
  State<InsideRoom> createState() => _InsideRoomState();
}

class _InsideRoomState extends State<InsideRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
    );
  }
}